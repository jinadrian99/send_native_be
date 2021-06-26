const booking = require('../Booking/booking.service');
const bookingService = require('../BookingService/bookingService.service');

const BookingMBquantity = (quarter, year, cb) => {
    booking.getTotalMoneyBookingByQuarterly(quarter, year, (err, money) => {
        if(err) { return res.status(500).json(err) }
        return cb(money.tongThanhTien == null ? 0 : money.tongThanhTien);        
    })
}

const BookingServiceMBquantity = (quarter, year, cb) => {
    bookingService.getTotalMoneyBookingServiceByQuarterly(quarter, year, (err, money) => {
        if(err) { return res.status(500).json(err) }
        return cb(money.tongThanhTien == null ? 0 : money.tongThanhTien);        
    })
}

module.exports = {
    getBookingMoneyByQuarterlies: (req, res) => {
        var today = new Date();
        var year = today.getFullYear();
        var arrMoneyByQuarter = [];

        BookingMBquantity(1, year, (money) => {
            arrMoneyByQuarter.push(money)
            BookingMBquantity(2, year, (money) => {
                arrMoneyByQuarter.push(money)
                BookingMBquantity(3, year, (money) => {
                    arrMoneyByQuarter.push(money)
                    BookingMBquantity(4, year, (money) => {
                        arrMoneyByQuarter.push(money)
                        return res.status(200).json(arrMoneyByQuarter);
                    })
                })
            })
        })
    },
    getBookingServiceMoneyByQuarterlies: (req, res) => {
        var today = new Date();
        var year = today.getFullYear();
        var arrMoneyByQuarter = [];

        BookingServiceMBquantity(1, year, (money) => {
            arrMoneyByQuarter.push(money)
            BookingServiceMBquantity(2, year, (money) => {
                arrMoneyByQuarter.push(money)
                BookingServiceMBquantity(3, year, (money) => {
                    arrMoneyByQuarter.push(money)
                    BookingServiceMBquantity(4, year, (money) => {
                        arrMoneyByQuarter.push(money)
                        return res.status(200).json(arrMoneyByQuarter);
                    })
                })
            })
        })
    }
}