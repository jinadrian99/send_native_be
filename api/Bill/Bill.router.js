const express = require('express');
const router = express.Router();
const BillController = require("./Bill.controller");

router.get('/get-bills-by-id-customer-booking/:idKHD', BillController.getBillsByIDKHD);
router.get('/change-status-to-deposit-by-id-bill/:idPTT', BillController.changeStatusToDepositByIdPTT);
router.get('/change-status-to-paid-by-id-bill/:idPTT', BillController.changeStatusToPaidByIdPTT);
router.get('/change-status-to-cancel-by-id-bill/:idPTT', BillController.changeStatusToCancelByIdPTT);

router.get('/get-bill-by-idDDP/:id', BillController.getBillByIdDDP);
router.get('/cus-cancel/:id', BillController.cusCancel);
router.get('/admin-cancel/:id', BillController.adminCancel);
router.put('/update-money-in-bill/:id', BillController.updateBill);
router.get('/', BillController.index);
router.get('/:id', BillController.show);
router.post('/', BillController.store);
router.put('/:id', BillController.update);
router.put('/update-money-in-bill/:id', BillController.updateBill);
router.delete('/:id', BillController.destroy);

module.exports = router;