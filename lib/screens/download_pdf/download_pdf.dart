import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/res/res.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';

import '../../localization/app_localization.dart';
import '../../localization/translation_keys.dart';

class PdfApi {
  static CountriesController countriesController =
      Get.find<CountriesController>();

  static Future openFile({required File file}) {
    return PDFDocument.openFile(file);
  }

  static Future<File> generatePdfFile(Vouchers vouchers, Uint8List image,
      material.BuildContext buildContext) async {
    final pdf = Document();
    var data = await rootBundle.load("assets/fonts/Roboto/Roboto-Regular.ttf");
    var myFont = Font.ttf(data);
    var myTheme = ThemeData.withFont(
      base: Font.ttf(
        await rootBundle.load("assets/fonts/Roboto/Roboto-Regular.ttf"),
      ),
      bold: Font.ttf(
        await rootBundle.load("assets/fonts/Roboto/Roboto-Bold.ttf"),
      ),
      italic: Font.ttf(
        await rootBundle.load("assets/fonts/Roboto/Roboto-Italic.ttf"),
      ),
      boldItalic: Font.ttf(
        await rootBundle.load("assets/fonts/Roboto/Roboto-BoldItalic.ttf"),
      ),
    );

    pdf.addPage(
      MultiPage(
        theme: myTheme,
        build: (context) => [
          buildHeader(data: vouchers, font: myFont, context: buildContext),
          spacing(),
          buildBody(data: vouchers, font: myFont, buildContext: buildContext),
          spacing(),
          buildQrImage(
            image: image,
          ),
        ],
      ),
    );

    return PDFDocument.saveDocument(name: 'L${vouchers.id}', pdf: pdf);
  }

  static Widget buildHeader({
    required Vouchers data,
    required font,
    required material.BuildContext context,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: horizontalValue(12),
        vertical: verticalValue(6),
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalValue(16),
      ),
      color: const PdfColor(
        0.078,
        0.498,
        0.559,
      ),
      child: Row(
        children: [
          Spacer(),
          Text(
            AppLocalizations.of(context)!.translate(
              TranslationKeys.voucher_Number,
            ),
            style: TextStyle(
              font: font,
              fontSize: sizes.fontRatio! * 18,
              color: const PdfColor(
                1,
                1,
                1,
              ),
            ),
          ),
          Text(
            data.voucherNo,
            style: TextStyle(
              font: font,
              fontSize: sizes.fontRatio! * 18,
              color: const PdfColor(
                1,
                1,
                1,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  static Widget spacing() {
    return SizedBox(
      height: 3 * PdfPageFormat.cm,
    );
  }

  static Widget buildBody({
    required Vouchers data,
    required font,
    required material.BuildContext buildContext,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.travellerName,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.user.firstName + data.user.lastName,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.emailID,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.user.email,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.phoneNumber,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    data.user.mobileNumber,
                    style: TextStyle(
                      font: font,
                      fontSize: sizes.fontRatio! * 16,
                      color: const PdfColor(
                        00,
                        0.345,
                        0.392,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.nationality,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  getNationality(data.user.nationalityId),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.emiratesID,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.user.emirateId,
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.totalAmount,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  data.amount.toString(),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.paymentDate,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  getPaymentDate(
                    data.createdAt,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalValue(6),
              horizontal: horizontalValue(16),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(buildContext)!.translate(
                    TranslationKeys.paymentTime,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      0.078,
                      0.498,
                      0.559,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  getPaymentTime(
                    data.createdAt,
                  ),
                  style: TextStyle(
                    font: font,
                    fontSize: sizes.fontRatio! * 16,
                    color: const PdfColor(
                      00,
                      0.345,
                      0.392,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildQrImage({required Uint8List image}) {
    var img = MemoryImage(image);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Image(
        img,
      ),
    );
  }

  static Widget buildFooter({
    required Vouchers data,
  }) {
    return Container(
      width: double.infinity,
      height: sizes.heightRatio! * 60,
      color: const PdfColor(
        00,
        0.345,
        0.392,
      ),
    );
  }

  // it will make a named dircotory in the internal storage and then return to its call
  static Future<File> saveDocument({
    String name = 'voucher',
    required Document pdfD,
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

  static String getPaymentTime(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(12, 19);
    }
    return '';
  }

  static String getPaymentDate(String dateTime) {
    if (dateTime.isNotEmpty) {
      return dateTime.substring(0, 10);
    }
    return '';
  }
}

class PDFDocument {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = (await getExternalStorageDirectory())?.path;
    final file = File('$dir/$name.pdf');

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
