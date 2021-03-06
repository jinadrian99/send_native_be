var fs = require('fs');
var customerStay = require('./CustomerStay.service');
var RRC = require('../RoomRentalContract/RRC.service');
const Validator = require('fastest-validator');

var xlsx = require('xlsx');

const valid = new Validator();
const schema = {
    tenKH: {
        type: 'string', min: 2,
        messages: {
            required: "Must input name!",
            string: "Name is string!",
            stringMin: "Name must be at least 2 characters!"
        }
    },
    CMND: {
        type: 'string', min: 9, max: 12,
        messages: {
            required: "Must input Identity card!",
            string: "Identity card is string!",
            stringMin: "Identity card must be at least 9 characters!",
            stringMax: "Identity card must be at most 12 characters!"
        }
    },
    Passport: {
        type: 'string', length: 8,
        messages: {
            required: "Must input Passport!",
            string: "Passport is string!",
            length: "Passport must be at 8 characters!"
        }
    },
    sdt: {
        type: 'string', length: 10,
        messages: {
            required: "Must input the phone number!",
            string: "Phone number is string!",
            length: "Phone number must be at 10 characters!"
        }
    },
    title: {
        type: 'string',
        messages: {
            required: "Must input the title!",
            string: "Title is string!",
        }
    },
}
const check = valid.compile(schema);

module.exports = {
    index: (req, res) => {
        customerStay.getAll((err, result) => {
            if(err) { return res.status(500).json(err); }
            return res.status(200).json(result);
        })
    },
    getCustomerStayByDateSave: (req, res) => {
        var date = req.body.date;
        customerStay.getDataByNgayTao(date, (err, result) => {
            if(err) { return res.status(500).json(err); }
            return res.status(200).json(result);
        })
    },
    show: (req, res) => {
        id = req.params.id;
        customerStay.getDataByID(id, (err, result) => {
            if(err) { return res.status(500).json(err); }
            if(result == null) { return res.status(400).json('Record not exists!'); }
            return res.status(200).json(result);
        })
    },
    store: (req, res) => {
        const data = req.body;

        var constraint = check(data);
        if(constraint !== true) { try { return res.status(400).json(constraint);  } catch (error) {} }

        customerStay.getDataByCMNDnPassportnSdt(data.CMND, data.Passport, data.sdt, (err, result) => {
            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
            if(result != null) { 
                customerStay.updateData(result.idKHO, data, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    try { return res.status(200).json("Created successfully") } catch (error) {}
                });
            } else { 
                customerStay.getDataByCMND(data.CMND, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    if(result != null){ try { return res.status(400).json("Exits this identity card!"); } catch (error) {} }
                });
                customerStay.getDataByPassport(data.Passport, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    if(result != null){ try { return res.status(400).json("Exits this Passport!");  } catch (error) {} }
                });
                customerStay.getDataBySdt(data.sdt, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    if(result != null){ try { return res.status(400).json("Exits this phone number!");  } catch (error) {} }
                });
                customerStay.createData(data, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    try { return res.status(200).json("Created successfully") } catch (error) {}
                });
            }
        })
    },
    importExcel: (req, res) => {
        if(req.files === null){ try{ return res.status(400).json("File not found"); } catch (error) {} }
        var file = req.files.fileCusStay;
        // console.log(file);
        var filePath = __dirname + "/uploads/" + file.name;

        file.mv(filePath, err => {
            if(err){ try{ return res.status(500).json(err); } catch (error) {} }
            var wb = xlsx.readFile(filePath, {cellDates: true});
            var ws = wb.Sheets[wb.SheetNames[0]];
            
            var dataExcel = xlsx.utils.sheet_to_json(ws);

            var data = dataExcel.map(record => {
                var kho = {};
                kho.idKHO = null;
                kho.CMND = record.Identity;
                kho.Passport = record.Passport;
                kho.sdt = record.Phone;
                kho.quocGia = record.National;
                kho.title = record.title || 'Mr';
                kho.tenKH = record.Name;
                kho.ngaySinh = record.Birthday;
                kho.ngayTao = new Date();

                return kho;
            })

            data.map(item => {
                customerStay.getDataByCMNDnPassportnSdt(item.CMND, item.Passport, item.sdt, (err, result) => {
                    if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                    if(result != null) { 
                        customerStay.updateData(result.idKHO, item, (err, result) => {
                            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                        });
                    } else { 
                        customerStay.createData(item, (err, result) => {
                            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
                        });
                    }
                }) 
            })

            fs.unlinkSync(filePath);
            try { return res.status(200).json("Created successfully") } catch (error) {} ;
        });

    },
    update: (req, res) => {
        const id = req.params.id;
        const data = req.body;

        var constraint = check(data);
        if(constraint !== true) try { return res.status(400).json(constraint) } catch (error) {} ;
        
        customerStay.getDataByCMND(data.CMND, (err, result) => {
            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
            if(result != null) { 
                if(result.idKHO != id) {
                    try { return res.status(400).json("Exits this identity card!"); } catch (error) {}  
                }
            }
        });
        customerStay.getDataByPassport(data.Passport, (err, result) => {
            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
            if(result != null) { 
                if(result.idKHO != id) {
                    try { return res.status(400).json("Exits this Passport!"); } catch (error) {}  
                }
            }
        });
        customerStay.getDataBySdt(data.sdt, (err, result) => {
            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
            if(result != null) { 
                if(result.idKHO != id) {
                    try { return res.status(400).json("Exits this phone number!"); } catch (error) {}  
                }
            }
        });

        customerStay.updateData(id, data, (err, result) => {
            if(err) { try { return res.status(500).json(err);  } catch (error) {} }
            try { return res.status(200).json("Updated successfully") } catch (error) {} ;
        })
    },
    destroy: (req, res) => {
        const id = req.params.id;
        customerStay.getDataByID(id, (err, result) => {
            if(err) { return res.status(500).json(err); }
            if(result == null) { return res.status(400).json('Record not exists to delete!'); }
            RRC.getDataByIdKHO(id, (err, result) => {
                if(err) { return res.status(500).json(err); }
                if(result.length > 0) { return res.status(400).json("Can't delete this customer!"); }
                customerStay.deleteData(id, (err, result) => {
                    if(err) { return res.status(500).json(err); }
                    return res.status(200).json("Delete successfully");
                })   
            })
                     
        })
    }
}