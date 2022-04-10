class EndPoints {
  final String _baseURL = 'https://v2-border-pay.vercel.app/api';
  final String _tourist = '/tourist';
  final String _registerUser = '/register';
  final String _loginUser = '/login';
  final String _voucherList = '/voucher/list';
  final String _company = '/tourist-company';
  final String _vouchers = '/vouchers';
  final String _voucher = '/voucher';
  final String _createVouchers = '/voucher/create';
  final String _createBulkVouchers = '/voucher/create-bulk';
  final String _countries = '/database/country';

  String registerUser() {
    return _baseURL + _tourist + _registerUser;
  }

  String logInUser() {
    return _baseURL + _tourist + _loginUser;
  }

  String voucherDetails(int userId, int voucherId) {
    return _baseURL + _tourist + '/$userId' + _voucher + '/$voucherId';
  }

  String voucherList(int id) {
    return _baseURL + _tourist + '/$id' + _voucherList;
  }

  String companyVoucherList(int id) {
    return _baseURL + _company + '/$id' + _vouchers;
  }

  String createVoucher(int id) {
    return _baseURL + _tourist + '/$id' + _createVouchers;
  }

  String createBulkVoucher(int id) {
    return _baseURL + _tourist + '/$id' + _createBulkVouchers;
  }

  String getCountries() {
    return _baseURL + _countries;
  }
}
