import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/datamodels/voucher_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VouchersPage extends StatefulWidget {
  const VouchersPage({Key? key}) : super(key: key);

  @override
  _VouchersPageState createState() => _VouchersPageState();
}

class _VouchersPageState extends State<VouchersPage> {
  VoucherModel companyVoucherList = VoucherModel();
  VoucherModel individualVoucherList = VoucherModel();
  VoucherRepo repo = VoucherRepoImpl();

  bool isLoading = true;
  bool isError = false;
  int selector = 0;

  @override
  void initState() {
    getCompanyVoucherData(1);
    getIndividualVoucherData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 33.73,
        // leading: Center(
        //   child: Container(
        //       height: 33.73,
        //       width: 33.73,
        //       // margin: EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(9.16),
        //           color: CustomizedTheme.colorAccent),
        //       child: BackButton()),
        // ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text("My Vouchers", style: CustomizedTheme.title_sf_W500_21),
        ),
      ),
      body: isLoading
          ? getLoadingScreen()
          : isError
              ? getErrorScreen()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selector = 0;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: selector == 0
                                          ? CustomizedTheme.primaryColor
                                          : CustomizedTheme.colorAccent),
                                  child: Text('Company Voucher',
                                      style: CustomizedTheme.w_W300_12)),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: selector == 1
                                        ? CustomizedTheme.primaryColor
                                        : CustomizedTheme.colorAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selector = 1;
                                    });
                                  },
                                  child: Text('Individual Voucher',
                                      style: CustomizedTheme.w_W300_12)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        child: TextFormField(
                          // controller: searchController,
                          onTap: () {
                            // onSearchTextChanged('');
                          },
                          // onChanged: onSearchTextChanged,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(13),
                            filled: true,
                            fillColor: Colors.white,
                            // enabledBorder: ,
                            prefix: const Icon(Icons.search),
                            // hintText: searchStudent,
                            label: const Text("Search"),
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 17.35.h, left: 20.w, right: 20.w),
                        child: Container(
                          height: 41.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 12.h),
                          decoration: BoxDecoration(
                              color: CustomizedTheme.colorAccent,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: Text(
                                  'Voucher No',
                                  style: CustomizedTheme.roboto_w_W500_14,
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Text('Location',
                                    style: CustomizedTheme.roboto_w_W500_14),
                              ),
                              Text('Status',
                                  style: CustomizedTheme.roboto_w_W500_14),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 28.71.h, horizontal: 26.53.w),
                        child: selector == 0 &&
                                companyVoucherList.data.isNotEmpty
                            ? const SizedBox.shrink()
                            : selector == 1 &&
                                    individualVoucherList.data.isNotEmpty
                                ? const SizedBox.shrink()
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: .5.h,
                                          color: CustomizedTheme.colorAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.56.w),
                                        child: Text('No transaction yet',
                                            style:
                                                CustomizedTheme.sf_b_W300_14),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: .5.h,
                                          color: CustomizedTheme.colorAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                      ),
                      ...List.generate(
                          selector == 0
                              ? companyVoucherList.data.length
                              : individualVoucherList.data.length,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 22.0.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/DetailedVoucher',
                                      arguments: selector == 0
                                          ? companyVoucherList.data[index]
                                          : individualVoucherList.data[index],
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: 10.h,
                                        top: 15.h,
                                        left: 10.w,
                                        right: 10.w),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    CustomizedTheme.colorAccent,
                                                width: 1.w))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              selector == 0
                                                  ? companyVoucherList
                                                      .data[index].id
                                                      .toString()
                                                  : individualVoucherList
                                                      .data[index].id
                                                      .toString(),
                                              style: CustomizedTheme
                                                  .sf_pb_W700_13),
                                        ),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              selector == 0
                                                  ? companyVoucherList
                                                      .data[index]
                                                      .location
                                                      .title
                                                  : individualVoucherList
                                                      .data[index]
                                                      .location
                                                      .title,
                                              style: CustomizedTheme
                                                  .sf_pb_W300_13),
                                        ),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              selector == 0
                                                  ? companyVoucherList
                                                      .data[index].status
                                                  : individualVoucherList
                                                      .data[index].status,
                                              textAlign: TextAlign.end,
                                              style: CustomizedTheme
                                                  .sf_b_W300_13Paid),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ],
                  ),
                ),
    );
  }

  Future<void> getCompanyVoucherData(int id) async {
    var response = await repo.getCompanyVoucherList(id);
    if (response != null) {
      companyVoucherList = response;
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  Future<void> getIndividualVoucherData(int id) async {
    var response = await repo.getVoucherList(id);
    if (response != null) {
      individualVoucherList = response;
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  Widget getLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getErrorScreen() {
    return const Center(
      child: Text('No data found',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
    );
  }
}
