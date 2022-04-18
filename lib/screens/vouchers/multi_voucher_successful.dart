import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/screens/download_pdf/download_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class MultiVoucherSuccessPage extends StatefulWidget {
  final List<Vouchers> vouchersData;

  const MultiVoucherSuccessPage({Key? key, required this.vouchersData})
      : super(key: key);

  @override
  _MultiVoucherSuccessPageState createState() =>
      _MultiVoucherSuccessPageState();
}

class _MultiVoucherSuccessPageState extends State<MultiVoucherSuccessPage> {
  CountriesController countriesController = Get.find<CountriesController>();
  bool _expanded = false;
  bool isLoading = false;

  ScreenshotController screenshotController = ScreenshotController();
  List<Uint8List>? qrImages = List.empty(growable: true);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    for (int i = 0; i < widget.vouchersData.length; i++) {
      getQrImage(
        voucherNumber: widget.vouchersData[i].voucherNo,
      );
    }
    print('voucher data qr code image list!!!');
    super.initState();
  }

  Future<void> getQrImage({
    required String voucherNumber,
  }) async {
    VoucherRepo repo = VoucherRepoImpl();
    final res = await repo.getQrCodeImage(
      voucherNumber: voucherNumber,
    );
    if (res != null) {
      List<String> images = res.toString().split(',');
      Uint8List image = base64.decode(images[1]);
      qrImages?.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: CustomizedTheme.white,
      body: SafeArea(
        top: Platform.isIOS ? false : true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 235.61.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: CustomizedTheme.primaryBold,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      30.r,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteConstant.hostPage,
                          ModalRoute.withName(
                            RouteConstant.hostPage,
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 50.0.h,
                          left: 20.36.w,
                          right: 20.36.w,
                        ),
                        child: Container(
                          height: 37.26.h,
                          width: 37.26.w,
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.11.r,
                            ),
                            color: CustomizedTheme.white,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: CustomizedTheme.colorAccent,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 37.w,
                        right: 37.w,
                        top: 17.43.h,
                      ),
                      child: Container(
                        width: 1.sw,
                        height: 83.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomizedTheme.white,
                              spreadRadius: 0,
                              blurRadius: 1,
                              offset: const Offset(
                                0,
                                5,
                              ), // changes position of shadow
                            ),
                          ],
                          // border: Border.all(color: CustomizedTheme.white,width: 5),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                              22.r,
                            ),
                          ),
                          color: CustomizedTheme.white,
                        ),
                        child: Center(
                          child: Text(
                            'Voucher Successful',
                            style: CustomizedTheme.sf_b_W600_2487,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 75.39.h,
                  left: 20.w,
                  right: 20.w,
                ),
                child: Container(
                  width: 1.sw,
                  // height: 109.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/payments/voucher-bg-multi.png',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 19.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Voucher Number : ',
                              style: CustomizedTheme.roboto_w_W400_20,
                            ),
                            Container(
                              width: 150.w,
                              child: Text(
                                widget.vouchersData.isNotEmpty
                                    ? 'L${widget.vouchersData[0].id.toString()}'
                                    : 'L',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CustomizedTheme.roboto_w_W700_20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Number of travellers: ',
                            style: CustomizedTheme.roboto_w_W400_14,
                          ),
                          Text(
                            widget.vouchersData.length.toString(),
                            style: CustomizedTheme.roboto_w_W700_14,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 12.h,
                              bottom: 5.h,
                              left: 19.w,
                            ),
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              color: CustomizedTheme.white,
                              child: Image.asset(
                                'assets/icons/ic_qr_small.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Screenshot(
                  controller: screenshotController,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.vouchersData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ExpansionPanelList.radio(
                        animationDuration: const Duration(
                          milliseconds: 600,
                        ),
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        children: [
                          ExpansionPanelRadio(
                            backgroundColor: CustomizedTheme.primaryBright,
                            headerBuilder: (context, isExpanded) {
                              return ListTile(
                                title: Text(
                                  "Traveller ${index + 1}",
                                  style: CustomizedTheme.sf_b_W500_19,
                                ),
                              );
                            },
                            body: Container(
                              decoration: BoxDecoration(
                                color: CustomizedTheme.primaryBright,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(
                                    10.r,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      top: 32.h,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Traveller Name',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          '${widget.vouchersData[index].user.firstName} ${widget.vouchersData[index].user.lastName}',
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Email ID',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          widget.vouchersData[index].user.email,
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Phone Number',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          widget.vouchersData[index].user
                                              .mobileNumber,
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Nationality',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          getNationality(widget
                                              .vouchersData[index]
                                              .user
                                              .nationalityId),
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Emirates ID',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          widget.vouchersData[index].user
                                              .emirateId,
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 26.45.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Total Amount',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          'AED ${widget.vouchersData[index].amount}',
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 26.45.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Payment Date',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          getPaymentDate(widget
                                              .vouchersData[index].createdAt),
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 15.w,
                                      right: 15.w,
                                      bottom: 24.01.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildText(
                                          'Payment Time',
                                          CustomizedTheme.sf_bo_W300_1503,
                                        ),
                                        buildText(
                                          getPaymentTime(
                                            widget
                                                .vouchersData[index].createdAt,
                                          ),
                                          CustomizedTheme.sf_bo_W500_1503,
                                        ),
                                      ],
                                    ),
                                  ),
                                  qrImages != null && qrImages!.isNotEmpty
                                      ? Image.memory(
                                          qrImages![index],
                                        )
                                      : const Icon(
                                          Icons.image,
                                        ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                ],
                              ),
                            ),
                            canTapOnHeader: true,
                            value: index + 1,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50.h,
                  horizontal: 20.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // width: 154.94,
                        height: 56.8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            11.72.r,
                          ),
                          // border: Border.all(color: CustomizedTheme.primaryColor,width: .5),
                          color: CustomizedTheme.colorAccent,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: CustomizedTheme.colorAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onPressed: () {
                            generateScreenshotImages(widget.vouchersData);
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Download / Print Summary",
                                  style: CustomizedTheme.sf_w_W500_19,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future generateScreenshotImages(List<Vouchers> vouchers) async {
    setState(() {
      isLoading = true;
    });
    for (int i = 0; i < vouchers.length; i++) {
      final pdfFile = await PdfApi.generatePdfFile(
        vouchers[i],
        qrImages![i],
      );

      PdfApi.openFile(file: File(pdfFile.path));
    }
    // screenshotController
    //     .capture(delay: const Duration(milliseconds: 10))
    //     .then((image) async {
    //   if (image != null) {
    //     final directory = await getApplicationDocumentsDirectory();
    //     final imagePath =
    //         await File('${directory.path}/image.png').create();
    //     await imagePath.writeAsBytes(image);
    //     if (await Permission.manageExternalStorage.request().isGranted) {
    //       await ImageGallerySaver.saveImage(image,
    //           quality: 100, name: fileName);
    //     }
    //   }
    // });
    setState(() {
      isLoading = true;
    });
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteConstant.hostPage,
      ModalRoute.withName(
        RouteConstant.hostPage,
      ),
    );
  }

  Text buildText(String title, TextStyle textStyle) =>
      Text(title, style: textStyle);

  String getNationality(int nationalityId) {
    int index = countriesController.countries
        .indexWhere((element) => element.id == nationalityId);
    return countriesController.countries[index].name;
  }

  String getPaymentTime(String dateTime) {
    return '09:30 PM';
  }

  String getPaymentDate(String dateTime) {
    return '21 October, 2021';
  }
}
