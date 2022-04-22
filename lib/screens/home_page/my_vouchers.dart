import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/localization/app_localization.dart';
import 'package:borderpay/localization/translation_keys.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyVouchers extends StatefulWidget {
  const MyVouchers({
    Key? key,
    required this.voucherList,
    required this.loadMoreData,
    required this.lastPage,
  }) : super(key: key);

  final VoucherModel voucherList;
  final Function loadMoreData;
  final bool lastPage;

  @override
  _MyVouchersState createState() => _MyVouchersState();
}

class _MyVouchersState extends State<MyVouchers> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: false,
      enablePullUp: !widget.lastPage,
      onLoading: () async {
        if (widget.lastPage) {
        } else {
          await widget.loadMoreData();
          _refreshController.loadComplete();
        }
      },
      child: _getList(),
    );
  }

  Widget _getList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 22.8.w,
      ),
      shrinkWrap: true,
      itemCount: widget.voucherList.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/DetailedVoucher',
              arguments: widget.voucherList.data[index],
            );
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 22.53.h,
              left: 10,
              right: 10,
              bottom: 12,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CustomizedTheme.colorAccent,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Text(
                    widget.voucherList.data[index].voucherNumber,
                    style: CustomizedTheme.sf_pb_W700_13,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: Text(
                    widget.voucherList.data[index].location.title,
                    style: CustomizedTheme.sf_pb_W300_13,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: Text(
                    widget.voucherList.data[index].status,
                    textAlign: TextAlign.end,
                    style: CustomizedTheme.sf_b_W300_13Paid,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
