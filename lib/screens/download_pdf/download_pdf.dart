import 'dart:io';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PdfApi {
  static CountriesController countriesController =
      Get.find<CountriesController>();

  static Future<File> generateCenteredText(Vouchers data) async {
    final pdfD = pw.Document();
    var data = await rootBundle.load("assets/fonts/Roboto/Roboto-Regular.ttf");
    var myFont = pw.Font.ttf(data);
    var myTheme = pw.ThemeData.withFont(
      base: pw.Font.ttf(await rootBundle.load("assets/fonts/Roboto/Roboto-Regular.ttf")),
      bold: pw.Font.ttf(await rootBundle.load("assets/fonts/Roboto/Roboto-Bold.ttf")),
      italic: pw.Font.ttf(await rootBundle.load("assets/fonts/Roboto/Roboto-Italic.ttf")),
      boldItalic:
          pw.Font.ttf(await rootBundle.load("assets/fonts/Roboto/Roboto-BoldItalic.ttf")),
    );

    // final font = await pdfGoogleFonts.nunitoExtraLight();
    // Text is added here in center
    pdfD.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        theme: myTheme,
        build: (context) => pw.Text(
              'download $data',
              style: pw.TextStyle(font: myFont),
            )
        // pw.Column(
        //   crossAxisAlignment: pw.CrossAxisAlignment.start,
        //   children: [
        //     pw.Padding(
        //       padding: const pw.EdgeInsets.only(top: 75.39, left: 20, right: 20),
        //       child: pw.Container(
        //         width: 1,
        //         height: 60,
        //         // decoration: pw.BoxDecoration(
        //         //     image: pw.DecorationImage(
        //         //   fit: pw.BoxFit.fill,
        //         //   // image: pw.Image(image: 'assets/payments/voucher-bg2.png')),
        //         // )),
        //         child: pw.Row(
        //           mainAxisAlignment: pw.MainAxisAlignment.center,
        //           children: [
        //             pw.Text(
        //               'Voucher Number : ',
        //               style:const pw.TextStyle(fontSize: 14),
        //             ),
        //             pw.SizedBox(width: 20),
        //             pw.Container(
        //               width: 100,
        //               child: pw.Text(
        //                 'L${data.id.toString()}',
        //                 maxLines: 1,
        //                 overflow: pw.TextOverflow.clip,
        //                 style: const pw.TextStyle(fontSize: 14),
        //               ),
        //             ),
        //             pw.SizedBox(width: 20),
        //             // pw.Container(
        //             //   height: 50,
        //             //   width: 50,
        //             //   padding: pw.EdgeInsets.all(5),
        //             //   // color: pdfC.white,
        //             //   child: pw.Image.asset(
        //             //     'assets/icons/ic_qr_small.png',
        //             //     fit: BoxFit.fill,
        //             //   ),
        //             // )
        //           ],
        //         ),
        //       ),
        //     ),
        //     pw.Padding(
        //       padding: const pw.EdgeInsets.symmetric(horizontal: 20),
        //       child: pw.Container(
        //         decoration: const pw.BoxDecoration(
        //             // color: CustomizedTheme.primaryBright,
        //             borderRadius: pw.BorderRadius.vertical(
        //                 bottom: pw.Radius.circular(10))),
        //         child: pw.Column(
        //           children: [
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, top: 32, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Traveller Name',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(
        //                       data.user.firstName + ' ' + data.user.lastName,
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text('Email ID',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(
        //                       data.user.email,style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Phone Number',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(data.user.mobileNumber,
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Nationality',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(getNationality(data.user.nationalityId),
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Emirates ID', style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(data.user.emirateId,
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Total Amount',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text(data.amount.toString(),
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 26.45),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Payment Date',style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text('21 October, 2021',
        //                       style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             pw.Padding(
        //               padding: const pw.EdgeInsets.only(
        //                   left: 15, right: 15, bottom: 24.01),
        //               child: pw.Row(
        //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   pw.Text(
        //                       'Payment Time', style: const pw.TextStyle(fontSize: 15)),
        //                   pw.Text('09:30 PM', style: const pw.TextStyle(fontSize: 15)),
        //                 ],
        //               ),
        //             ),
        //             // pw.Container(
        //             //     height: 117,
        //             //     width: 117,
        //             //     // color: CustomizedTheme.white,
        //             //     padding: const pw.EdgeInsets.all(11.86),
        //             //     child: pw.Image.asset(
        //             //       'assets/icons/ic_QR.png',
        //             //       fit: BoxFit.fill,
        //             //     )),
        //             pw.SizedBox(
        //               height: 24,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        ));

    // passing the pdf and name of the docoment to make a direcotory in  the internal storage
    return saveDocument(name: 'voucher.pdf', pdfD: pdfD);
  }

  // it will make a named dircotory in the internal storage and then return to its call
  static Future<File> saveDocument({
    String name = 'voucher',
    required pw.Document pdfD,
  }) async {
    // pdf save to the variable called bytes
    final bytes = await pdfD.save();

    // here a beautiful pakage  path provider helps us and take dircotory and name of the file  and made a proper file in internal storage
    final dir = await getApplicationDocumentsDirectory();
    final file = File('/storage/emulated/0/Download/$name');

    await file.writeAsBytes(bytes).then((value) {
      print('value=> $value');
    });

    // reterning the file to the top most method which is generate centered text.
    return file;
  }

  static String getNationality(int nationalityId) {
    int index = countriesController.countries
        .indexWhere((element) => element.id == nationalityId);
    return countriesController.countries[index].name;
  }
}
