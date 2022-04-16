import 'dart:convert';

import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/model/datamodels/create_bulk_voucher_model.dart';
import 'package:borderpay/model/datamodels/create_voucher_model.dart';
import 'package:borderpay/model/datamodels/pay_voucher_model.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/model/datamodels/voucher_transaction_model.dart';
import 'package:borderpay/services/network/network_endpoints.dart';
import 'package:borderpay/services/network/network_helper.dart';
import 'package:borderpay/services/network/network_helper_impl.dart';
import 'package:flutter/foundation.dart';

import 'voucher_repo.dart';

class VoucherRepoImpl implements VoucherRepo {
  NetworkHelper networkHelper = NetworkHelperImpl();
  EndPoints endPoints = EndPoints();

  @override
  Future getVoucherDetails(int userId, int voucherId) async {
    try {
      var response = await networkHelper.get(
        endPoints.voucherDetails(userId, voucherId),
      );
      if (response.statusCode == 200) {
        print(response.body);
        var data = json.decode(response.body.toString());
        return VoucherDataModel.fromJson(data['data']);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future getVoucherList({int page = 1, int limit = 15, id}) async {
    try {
      String url = endPoints.voucherList(1) +
          "?page=" +
          page.toString() +
          "&limit=" +
          limit.toString();
      var response = await networkHelper.get(
        url,
      );
      if (response.statusCode == 200) {
        VoucherModel model = VoucherModel.fromJson(
          json: json.decode(
            response.body.toString(),
          ),
        );

        if (model.data.length > model.limit) {
          model.lastPage = false;
          model.page += 1;
          return model;
        } else {
          model.lastPage = true;
          return model;
        }
      } else {
        return null;
      }
    } catch (e) {}
  }

  @override
  Future getCompanyVoucherList(id) async {
    try {
      var response = await networkHelper.get(
        endPoints.companyVoucherList(id),
      );
      if (response.statusCode == 200) {
        return VoucherModel.fromJson(
          json: json.decode(
            response.body.toString(),
          ),
        );
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future createVoucher(CreateVoucherModel voucher, int id) async {
    try {
      var response = await networkHelper.post(
        endPoints.createVoucher(id),
        body: voucher.toJson(),
      );
      if (response.statusCode == 201) {
        print(response.body);
        return json.decode(response.body.toString())['data']['insertedId'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future createBulkVoucher(CreateBulkVoucherModel voucher, int id) async {
    try {
      var response = await networkHelper.post(
        endPoints.createBulkVoucher(id),
        body: voucher.toJson(),
      );
      if (response.statusCode == 201) {
        print(response.body);
        return BulkVouchersModel.fromJson(
            json.decode(response.body.toString()));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future createVoucherTransaction(
      VoucherTransactionRequest voucherIds, int id) async {
    try {
      var response = await networkHelper.post(
        endPoints.createVoucherTransaction(id),
        body: voucherIds.toJson(),
      );
      if (response.statusCode == 201) {
        print(response.body);
        return VoucherTransactionReceived.fromJson(
            json.decode(response.body.toString()));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future payVoucher(PayVoucherModel voucher, int id) async {
    try {
      var response = await networkHelper.post(
        endPoints.payVoucher(id),
        body: voucher.toJson(),
      );
      if (response.statusCode == 201) {
        print(response.body);
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future payVoucherTransaction(transaction) async {
    try {
      var response = await networkHelper.post(
        endPoints.payTransaction(),
        body: transaction,
      );
      if (response.statusCode == 201) {
        print(response.body);
        return json.decode(response.body.toString());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
