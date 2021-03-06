const pool = require("../../config/database");

module.exports = {
    createData: (data, cb) => {
        pool.query(
            `insert into PHIEUTHUEPHONG VALUES(?,?,?,?,?,?,?)`,
            [
                data.idPTP,
                data.ngayDen,
                data.ngayDi,
                data.trangThai,
                data.maPhong,
                data.idDDP,
                data.idKHO
            ],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result.insertId);
            }
        )
    },
    getAll: (cb) => {
        pool.query(
            `select * from PHIEUTHUEPHONG`,
            [],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    getDataByID: (id, cb) => {
        pool.query(
            `select * from PHIEUTHUEPHONG where idPTP = ?`,
            [id],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result[0]);
            }
        )
    },
    getDataByIdDDP: (idDDP, cb) => {
        pool.query(
            `select * from PHIEUTHUEPHONG where idDDP = ?`,
            [idDDP],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    getDataByIdKHO: (idKHO, cb) => {
        pool.query(
            `select * from PHIEUTHUEPHONG where idKHO = ?`,
            [idKHO],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    getDataByIdKHDWithStatusRRC: (idKHD, statusRRC, cb) => {
        // lấy các PTP theo KHD và trạng thái của PTP ntn
        pool.query(
            `
                SELECT PHIEUTHUEPHONG.*
                FROM PHIEUTHUEPHONG LEFT JOIN DONDATPHONG ON DONDATPHONG.idDDP = PHIEUTHUEPHONG.idDDP
                WHERE DONDATPHONG.idKHD = ? AND PHIEUTHUEPHONG.trangThai = ?
                GROUP BY PHIEUTHUEPHONG.idPTP
            `,
            [
                idKHD,
                statusRRC
            ],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },    
    getDataByIdKHDIdDDPWithStatusRRC: (idKHD, idDDP, statusRRC, cb) => {
        // lấy các PTP theo DDP và KHD và trạng thái của PTP ntn
        pool.query(
            `
                SELECT PHIEUTHUEPHONG.*
                FROM PHIEUTHUEPHONG LEFT JOIN DONDATPHONG ON DONDATPHONG.idDDP = PHIEUTHUEPHONG.idDDP
                WHERE DONDATPHONG.idKHD = ? AND DONDATPHONG.idDDP = ? AND PHIEUTHUEPHONG.trangThai = ?
                GROUP BY PHIEUTHUEPHONG.idPTP
            `,
            [
                idKHD,
                idDDP,
                statusRRC
            ],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    findIDRoombyDays: (dateA, dateB, trangThai, cb) => {
        pool.query(
            `SELECT maPhong FROM PHIEUTHUEPHONG WHERE ngayDi >= ? and ngayDen <= ? and trangThai = ?`,
            [
                dateA,
                dateB,
                trangThai
            ],
            (error, result) => {
                if(error) { return cb(error); }
                return cb(null, result);
            }
        )
    },
    updateData: (id, data, cb) => {
        pool.query(
            `update PHIEUTHUEPHONG set
                ngayDen = ?,
                ngayDi = ?,
                trangThai = ?,
                maPhong = ?,
                idDDP = ?,
                idKHO = ?
            where idPTP = ?`,
            [
                data.ngayDen,
                data.ngayDi,
                data.trangThai,
                data.maPhong,
                data.idDDP,
                data.idKHO,
                id
            ],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    updateStatusByIDDDP: (idDDP, status, cb) => {
        pool.query(
            `update PHIEUTHUEPHONG set
                trangThai = ?
            where idDDP = ?`,
            [
                status,
                idDDP
            ],
            (error, result) => {
                if(error) {
                    return cb(error);
                }
                return cb(null, result);
            }
        )
    },
    deleteData: (id, callBack) => {
        pool.query(
            `delete from PHIEUTHUEPHONG where idPTP = ?`,
            [id],
            (error, result) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null, result); 
            }
        )
    },
    getDataByUniToInsert: (idDDP, idKHO, maPhong, callBack) => {
        pool.query(
            `SELECT * FROM PHIEUTHUEPHONG WHERE idDDP = ? AND idKHO = ? AND maPhong = ?`,
            [
                idDDP,
                idKHO,
                maPhong,
            ],
            (error, result) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null, result[0]); 
            }
        )
    },
    getDataByUniToUpdate: (idDDP, idKHO, maPhong, id, callBack) => {
        pool.query(
            `SELECT * FROM PHIEUTHUEPHONG WHERE idDDP = ? AND idKHO = ? AND maPhong = ? AND idPTP != ?`,
            [
                idDDP,
                idKHO,
                maPhong,
                id
            ],
            (error, result) => {
                if(error){
                    return callBack(error);
                }
                return callBack(null, result[0]); 
            }
        )
    }
};