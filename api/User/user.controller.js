const user = require('./user.service');

const { genSaltSync, hashSync, compareSync } = require('bcrypt');
const { sign } = require('jsonwebtoken');
const { JWT_SECRET } = require('../../config/jwt_secret');

var khd = require('../KhachHangDat/khd.service');

// const Validator = require('fastest-validator');
// const valid = new Validator();
// const schema = {
//     email: { 
//         type: 'email',
//         messages: {
//             required: "Fill out email field!",
//             email: "Email wrong!"
//         }
//     },
//     password: { 
//         type: 'string', min: 6,
//         messages: {
//             required: "Fill out password field!",
//             stringMin: "Password at least 6 characters!"
//         }
//     },
//     displayName: { 
//         type: 'string', min: 6,
//         messages: {
//             required: "Fill out username field!",
//             stringMin: "Username at least 6 characters!"
//         }
//     },
//     tenKH: { 
//         type: 'string', min: 6,
//         messages: {
//             required: "Fill out full name field!",
//             stringMin: "Full name at least 6 characters!"
//         }
//     },
//     sdt: { 
//         type: 'string', min: 10,
//         messages: {
//             required: "Fill out phone number field!",
//             stringMin: "Phone at least 10 numbers!"
//         }
//     }
// }
// const check = valid.compile(schema);

module.exports = {
    createUser: (req, res) => {
        const data = req.body;
        // var constraint = check(data);
        // if(constraint !== true) return res.status(400).json(constraint);
        if (data.loaiTaiKhoan !== 1) {
            const salt = genSaltSync(10);
            data.password = hashSync(data.password, salt);
        }
        user.createData(data, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json(err);
            }
            return res.status(200).json(results);
        });
    },
    getUsers: (req, res) => {
        user.getAll((err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            return res.status(200).json(results);
        });
    },
    getUserByIDAdmin: (req, res) => {
        const id = req.params.id;
        user.getDataByIDAdmin(id, (err, results) => {
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
    getUserByID: (req, res) => {
        const id = req.params.id;
        user.getDataByID(id, (err, results) => {
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
    updateUser: (req, res) => {
        const id = req.params.id;
        const data = req.body;
        // var constraint = check(data);
        // if(constraint !== true) return res.status(400).json(constraint);
        if (data.isChangePass) {
            console.log('data currentPass: ', data.currentPass);
            user.getDataByIDAdmin(data.idAdmin, (err, results) => {
                if (err) {
                    console.log(err);
                    return res.status(500).json(err);
                }
                if (results.length == 0) {
                    return res.status(400).json({
                        err:'Not found'
                    })
                }
                console.log('data.email: ', data.email);
                console.log('results.email: ', results[0].email);
                console.log('data.password: ', data.password);
                if (data.email !== results[0].email) {
                    console.log('hello');
                    user.getUserByEmail(data.email, (err, kq) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        if (kq.length > 0) {
                            return res.status(400).json({
                                err:'Email existed!!!'
                            })
                        }
                        const result = compareSync(data.currentPass, results[0].password);
                        console.log('kq tra ve: ', result);
                        if (result) {
                            var salt = genSaltSync(10);
                            data.password = hashSync(data.password, salt);
                            user.updateData(id, data, (err, results) => {
                                if(err) {
                                    console.log(err);
                                    return res.status(500).json(err);
                                }
                                if(results == null) {
                                    return res.status(404).json('Record not found');
                                }
                                return res.status(200).json('Updated successfully');
                            });
                        }
                        else {
                            return res.status(404).json('Current password does not match!');
                        }
                    })
                }
                else {
                    const result = compareSync(data.currentPass, results[0].password);
                    if (result) {
                        var salt = genSaltSync(10);
                        data.password = hashSync(data.password, salt);
                        user.updateData(id, data, (err, results) => {
                            if(err) {
                                console.log(err);
                                return res.status(500).json(err);
                            }
                            if(results == null) {
                                return res.status(404).json('Record not found');
                            }
                            return res.status(200).json('Updated successfully');
                        });
                    }
                    else {
                        return res.status(404).json('Current password does not match!');
                    }
                }
            })
        }
        else {
            user.getDataByIDAdmin(data.idAdmin, (err, results) => {
                if (err) {
                    console.log(err);
                    return res.status(500).json(err);
                }
                if (results.length == 0) {
                    return res.status(400).json({
                        err:'Not found'
                    })
                }
                if (data.email !== results[0].email) {
                    user.getUserByEmail(data.email, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        if (results.length > 0) {
                            return res.status(400).json({
                                err:'Email existed!!!'
                            })
                        }
                        if (results.length == 0) {
                            user.updateData(id, data, (err, results) => {
                                if(err) {
                                    console.log(err);
                                    return res.status(500).json(err);
                                }
                                if(results == null) {
                                    return res.status(404).json('Record not found');
                                }
                                return res.status(200).json('Updated successfully');
                            });
                        }
                    })
                }
                else {
                    user.updateData(id, data, (err, results) => {
                        if(err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        if(results == null) {
                            return res.status(404).json('Record not found');
                        }
                        return res.status(200).json('Updated successfully');
                    });
                }
            })
        }
    },
    deleteUser: (req, res) => {
        const id = req.params.id;
        user.deleteData(id, (err, results) => {
            if(err) {
                console.log(err);
                return res.status(500).json(err);
            }
            if(results == 0) {
                return res.status(404).json('Record not found');
            }
            return res.status(200).json('Deleted successfully');
        })
    },
    login: (req, res) => {
        const data = req.body;
        // var constraint = check(data);
        // if(constraint !== true) return res.status(400).json(constraint);
        user.getUserByEmail(data.email, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json(err);
            }
            if (results.length == 0) {
                return res.status(400).json({
                    err:'Invalid email or password'
                })
            }
            const result = compareSync(data.password, results[0].password);
            console.log('hi:', result);
            console.log('results:', results);
            if (result) {
                results.password = undefined;
                const jsontoken = sign({ result: results }, JWT_SECRET, {
                    expiresIn: "30s"
                });
                res.setHeader("Authorization", jsontoken);
                return res.status(200).json({
                    results
                });
            }
            else {
                return res.status(400).json({
                    err:'Invalid email or password'
                })
            }
        });
    },
    register: (req, res) => {
        const data = req.body;
        // var constraint = check(data);
        // console.log('err:', constraint);
        // if(constraint !== true) {
        //     return res.status(400).json(constraint);
        // }
        if (data.loaiTaiKhoan === 1) {
            user.getUserByEmail(data.email, (err, results) => {
                if (err) {
                    khd.deleteData(data.idKHD, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        return res.status(200).json(results);
                    });
                }
                if (results.length > 0) {
                    khd.deleteData(data.idKHD, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        return res.status(200).json(results);
                    });
                }
                if (results.length == 0) {
                    user.createData(data, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        return res.status(200).json(results);
                    });
                }
            });
        }
        if (data.loaiTaiKhoan === 2) {
            user.getUserByEmail(data.email, (err, results) => {
                if (err) {
                    console.log(err);
                    khd.deleteData(data.idKHD, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        return res.status(200).json(results);
                    });
                }
                if (results.length > 0) {
                    if (results[0].loaiTaiKhoan === 1) {
                        khd.updateData(results[0].idKHD, data, (err, result) => {
                            if (err) {
                                console.log(err);
                                return res.status(500).json(err);
                            }
                            if(result == null) {
                                return res.status(404).json('Record not found');
                            }
                            khd.deleteData(data.idKHD, (err, result) => {
                                if (err) {
                                    console.log(err);
                                    return res.status(500).json(err);
                                }
                                const salt = genSaltSync(10);
                                data.password = hashSync(data.password, salt)
                                data.idKHD = results[0].idKHD;; //doi lai idKHD de update KHD
                                // console.log(results[0].idTK);
                                // console.log(data);
                                user.updateData(results[0].idTK, data, (err, result) => {
                                    if(err) {
                                        console.log(err);
                                        return res.status(500).json(err);
                                    }
                                    if(result == null) {
                                        return res.status(404).json('Record not found');
                                    }
                                    console.log(result);
                                    return res.status(200).json('Updated successfully');
                                })
                            });
                        })
                    }
                    if (results[0].loaiTaiKhoan === 2) {
                        khd.deleteData(data.idKHD, (err, result) => {
                            if (err) {
                                console.log(err);
                                return res.status(500).json(err);
                            }
                            return res.status(200).json(result);
                        });
                    }
                }
                if (results.length == 0) {
                    if (data.loaiTaiKhoan !== 1) {
                        const salt = genSaltSync(10);
                        data.password = hashSync(data.password, salt);
                    }
                    user.createData(data, (err, results) => {
                        if (err) {
                            console.log(err);
                            return res.status(500).json(err);
                        }
                        return res.status(200).json(results);
                    });
                }
            });
        }
    }
}