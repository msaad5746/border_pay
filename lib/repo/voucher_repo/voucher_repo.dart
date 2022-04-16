import 'package:borderpay/model/datamodels/create_bulk_voucher_model.dart';
import 'package:borderpay/model/datamodels/create_voucher_model.dart';
import 'package:borderpay/model/datamodels/pay_voucher_model.dart';
import 'package:borderpay/model/datamodels/voucher_transaction_model.dart';

mixin VoucherRepo {
  Future<dynamic> getVoucherDetails(int userId, int voucherId);

  Future<dynamic> getVoucherList({int page=1, int limit=15, id});

  Future<dynamic> getCompanyVoucherList(id);

  Future<dynamic> createVoucher(CreateVoucherModel voucher, int id);

  Future createBulkVoucher(CreateBulkVoucherModel voucher, int id);

  Future createVoucherTransaction(VoucherTransactionRequest voucherIds, int id);

  Future payVoucher(PayVoucherModel voucher, int id);

  Future payVoucherTransaction(dynamic transaction);
}
