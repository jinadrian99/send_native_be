const { 
    createData,
    getAll, 
    getDataByID,
    updateData,
    deleteData
} = require('./roomType.service');

var roomTypeImage = require('../ImageRoomType/imageRoomType.service');
var dailyRate = require('../DailyRate/dailyRate.service');
var specialRate = require('../SpecialRate/specialRate.service');
var room = require('../Room/room.service');
var bill = require('../Bill/Bill.service');
var DBill = require('../BillDetail/BillD.service');
var RRC = require('../RoomRentalContract/RRC.service');
const Validator = require('fastest-validator');

const valid = new Validator();
const schema = {
    tenLP: {
        type: 'string', min: 7, max: 30, 
        messages: {
            required: "Must input name!",
            stringMin: "Name must be at least 7 characters",
            stringMax: "Name must be at most 12 characters!"
        }
    },
    moTaCT: {
        type: 'string', min: 50,
        messages: {
            required: "Must input description!",
            stringMin: "Description must be at least 50 characters"
        }
    },
    moTaGT: {
        type: 'string', min: 25, max: 50,
        messages: {
            required: "Must input name!",
            stringMin: "Description intro must be at least 25 characters",
            stringMax: "Description intro must be at most 50 characters!"
        }
    },
    moTaTD: {
        type: 'string', min: 50, max: 80,
        messages: {
            required: "Must input name!",
            stringMin: "Description header must be at least 50 characters",
            stringMax: "Description header must be at most 80 characters!"
        }
    }
}

const check = valid.compile(schema);

module.exports = {
    createRoomType: (req, res) => {
        const data = req.body;
        
        var constraint = check(data);
        if(constraint !== true) { try { return res.status(400).json(constraint);  } catch (error) {} }

        createData(data, (err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            return res.status(200).json(results);
        });
    },
    getRoomTypes: (req, res) => {
        getAll((err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            return res.status(200).json(results);
        });
    },
    getRoomTypeByID: (req, res) => {
        const id = req.params.id;
        getDataByID(id, (err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            if(results == null) {
                return res.status(404).json('Record not found');
            }
            return res.status(200).json(results);
        });
    },
    updateRoomType: (req, res) => {
        const id = req.params.id;
        const data = req.body;

        var constraint = check(data);
        if(constraint !== true) { try { return res.status(400).json(constraint);  } catch (error) {} }

        updateData(id, data, (err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            if(results == null) {
                return res.status(404).json('Record not found');
            }
            room.updateSoNguoiByIdLP(id, data.soNguoi, (err, result) => {
                return res.status(200).json('Updated successfully');
            })
        });
    },
    deleteRoomType: (req, res) => {
        const id = req.params.id;
        roomTypeImage.getDataByIDLP(id, (err, results)=>{
            if(err){ return res.status(500).json(err); }
            if(results.length > 0) return res.status(400).json('Exists room type image!');
            else {
                room.getDataByIDLP(id, (err, results) => {
                    if(err){ return res.status(500).json(err); }
                    if(results.length > 0) return res.status(400).json('Exists room type of rooms');
                    deleteData(id, (err, results) => {
                        if(err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        if(results == 0) {
                            return res.status(404).json('Record not found');
                        }
                        return res.status(200).json('Deleted successfully');
                    });
                })
            }
        });
    },
    getRateByIDLP : (req, res) => {
        const idLP = req.params.idLP;

        dailyRate.getDataByIDLP(idLP, (err, result) => {
            if(err) { return res.status(500).json(err); }
            if(result.length <= 0) { return res.status(200).json(null); } // ch??a c?? b???ng gi??  
            if (result.length > 0) {
                // l???y ng??y g???n nh???t trong qu?? kh??? k??? c??? ng??y hi???n t???i, kh??ng l???y ng??y t????ng lai
                var today = new Date();
                var arrRate = result;
                var recordRate = null;
                var diffDayMin = null;

                arrRate.forEach(item => {
                    var day = new Date(item.ngayBatDau);
                    var diffDay = (today.getTime() - day.getTime())/(1000*60*60*24);

                    if(diffDay >= 0 && diffDayMin == null){
                        recordRate = item;
                        diffDayMin = diffDay;
                    }
                    if(diffDay >= 0 && diffDayMin >= diffDay){
                        console.log(item);
                        recordRate = item;
                        diffDayMin = diffDay;
                    }
                });

                //c?? ??c recordRate ta s??? len l??i v??o t???n trong Special Rate ????? xem c?? ng??y n??o l?? hn ko?
                var thu = today.getDay();
                var idGTN = recordRate.idGTN;

                specialRate.getDataByThuNIDGTN(thu, idGTN, (err, result) => {
                    if(err) { return res.status(500).json(err); }
                    if(result.length > 0) { 
                        return res.status(200).json(result[0].giaTheoThu);
                    }
                    return res.status(200).json(recordRate.giaMoiTuan);
                })
            }
        })
    },
    getRoomsByIDLP: (req, res) => {
        const idLP = req.params.idLP;
        room.getDataByIDLP(idLP, (err, result) => {
            if(err) { return res.status(500).json(err); }
            if(result.length <= 0) { return res.status(200).json(null) }
            return res.status(200).json(result);
        })
    },
    searchRoomTypeByDays: (req, res) => {
        const dateA = req.body.dateA;
        const dateB = req.body.dateB;

        var arrLP = [];
        getAll((err, lstLP) => {
            if(err) { try { return res.status(500).json(err); } catch (error) {} }
            if(lstLP.length <= 0){ try{ return res.status(200).json("Ch??a c?? LP");} catch (error) {} }
            lstLP.forEach(item => {
                var obj = {
                    idLP: item.idLP, 
                    tenLP: item.tenLP,
                    hangPhong: item.hangPhong,
                    soLuong: item.soLuongHT
                };
                arrLP.push(obj); // l???y dsLP ra ????? tr???
            });
            // console.log(arrLP);

            //SELECT `idPTT` FROM `PHIEUTHANHTOANPHONG` WHERE ngayDen <= "2021-06-19" and ngayDi >= "2021-06-15"
            bill.findIDbyDays(dateA, dateB, 2, (err, lstPTT) => {
                console.log("Bill: ", err, lstPTT);
                if(err) { try { return res.status(500).json(err); } catch (error) {} }
                //Ki???m tra xem ????y c?? ph???i l?? nh??nh KH ??ang ??? hay ko?
                if(lstPTT.length <= 0) { //Phi???u thanh to??n ph??ng ko ph???i ??? tr???ng th??i (2)thanh to??n ti???n c???c
                    RRC.findIDRoombyDays(dateA, dateB, 1, (err, lstPTP) => { //N???u ko c?? tr???ng th??i thanh to??n ti???n c???c th?? ch???y d??ng n??y
                        console.log("RRC: ", err, lstPTP);
                        if(err) { try { return res.status(500).json(err); }  catch (error) {} }
                        if(lstPTP.length <= 0) { 
                            try { return res.status(200).json(arrLP); } catch (error) {}
                        }
                        if(lstPTP.length > 0) { 
                            var count2 = lstPTP.length;
                            lstPTP.forEach(item => {
                                room.getDataByID(item.maPhong, (err, PHONG) => {
                                    console.log("room: ", err, PHONG);
                                    count2 --; //b??? ?????m d??ng ????? x??t khi n??o ng???ng d??ng for (v?? asynchronous)
                                    if(err) { try { return res.status(500).json(err); } catch (error) {} }
                                    if(PHONG != null){ 
                                        // console.log("PHONG_idLP", PHONG.idLP);
                                        var index = arrLP.findIndex(item => item.idLP == PHONG.idLP);// t??m index trong arrLP ????? tr???
                                        arrLP[index]={
                                            idLP: arrLP[index].idLP,
                                            tenLP: arrLP[index].tenLP,
                                            hangPhong: arrLP[index].hangPhong,
                                            soLuong: arrLP[index].soLuong - 1
                                        }
                                    }
                                    if(count2 == 0){ 
                                        console.log("arrLP: ", arrLP);
                                        try { return res.status(200).json(arrLP); } catch (error) {}
                                    }
                                })
                            })
                        }
                    })
                }
                //Nh??nh KH thanh to??n ti???n c???c
                lstPTT.forEach(item => { //N???u c?? tr???ng th??i (2)thanh to??n ti???n c???c th?? ch???y d??ng n??y
                    // console.log("PTT: ", item.idPTT);
                    DBill.getDataByIDPTT(item.idPTT, (err, lstCTPTT) => {
                        console.log("DBill: ", err, lstCTPTT)
                        if(err) { try { return res.status(500).json(err); } catch (error) {} }
                        if(lstCTPTT.length > 0) { 
                            var count1 = lstCTPTT.length;
                            lstCTPTT.forEach(item => {
                                // console.log("CTPTT_maPhong: ", item.maPhong);
                                room.getDataByID(item.maPhong, (err, PHONG) => {
                                    console.log("room: ", err, PHONG);
                                    count1 --;
                                    if(err) { try { return res.status(500).json(err); } catch (error) {} }
                                    if(PHONG != null){ 
                                        // console.log("PHONG_idLP", PHONG.idLP);
                                        var index = arrLP.findIndex(item => item.idLP == PHONG.idLP);
                                        arrLP[index]={
                                            idLP: arrLP[index].idLP,
                                            tenLP: arrLP[index].tenLP,
                                            hangPhong: arrLP[index].hangPhong,
                                            soLuong: arrLP[index].soLuong - 1
                                        }
                                    }
                                    // console.log(arrLP, count);
                                    if(count1 == 0){ 
                                        RRC.findIDRoombyDays(dateA, dateB, 1, (err, lstPTP) => {
                                            console.log("RRC: ", err, lstPTP);
                                            if(err) { try { return res.status(500).json(err); } catch (error) {} }
                                            if(lstPTP.length <= 0){ 
                                                console.log("arrLP: ", arrLP);
                                                // console.log('res', res);
                                                try { return res.status(200).json(arrLP); } catch (error) {}
                                            }
                                            if(lstPTP.length > 0) { 
                                                var count2 = lstPTP.length;
                                                lstPTP.forEach(item => {
                                                    room.getDataByID(item.maPhong, (err, PHONG) => {
                                                        console.log("room: ", err, PHONG);
                                                        count2 --;
                                                        if(err) { try { return res.status(500).json(err); } catch (error) {} }
                                                        if(PHONG != null){ 
                                                            // console.log("PHONG_idLP", PHONG.idLP);
                                                            var index = arrLP.findIndex(item => item.idLP == PHONG.idLP);
                                                            arrLP[index]={
                                                                idLP: arrLP[index].idLP,
                                                                tenLP: arrLP[index].tenLP,
                                                                hangPhong: arrLP[index].hangPhong,
                                                                soLuong: arrLP[index].soLuong - 1
                                                            }
                                                        }
                                                        if(count2 == 0){ 
                                                            console.log("arrLP: ", arrLP);
                                                            if(res != null){ 
                                                                try { return res.status(200).json(arrLP); } catch (error) {}
                                                            }
                                                        }
                                                    })
                                                })
                                            }
                                        })
                                    }
                                })
                            });
                        }
                    });
                }); 
                
            });  
        })
    },
};