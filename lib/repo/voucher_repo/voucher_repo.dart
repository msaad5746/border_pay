import 'package:borderpay/model/datamodels/create_bulk_voucher_model.dart';
import 'package:borderpay/model/datamodels/create_voucher_model.dart';

mixin VoucherRepo {
  Future<dynamic> getVoucherDetails(int userId, int voucherId);

  Future<dynamic> getVoucherList(id);

  Future<dynamic> getCompanyVoucherList(id);

  Future<dynamic> createVoucher(CreateVoucherModel voucher, int id);

  Future createBulkVoucher(CreateBulkVoucherModel voucher, int id);
}
