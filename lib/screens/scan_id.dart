import 'dart:io';

import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/arguments/register_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ScanIDPage extends StatefulWidget {
  String firstName;
  String lastName;
  String phone;
  String password;
  String areaCode;
  String email;
  String nationality;
  int nationalityId;

  ScanIDPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.areaCode,
    required this.email,
    required this.nationality,
    required this.nationalityId,
  }) : super(key: key);

  @override
  _ScanIDPageState createState() => _ScanIDPageState();
}

class _ScanIDPageState extends State<ScanIDPage> {
  TextEditingController emirateController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  var whichImage;
  int groupValue = 0;

  _imgFromCamera() async {
    final XFile? cameraImage =
        await _picker.pickImage(source: ImageSource.camera);
    // File image = await _picker.getImage(
    //     source: ImageSource.camera, imageQuality: 50
    // );
    setState(() {
      _image = XFile(cameraImage!.path);
      whichImage = "camera";
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
        whichImage = "gallery";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 33.73,
        leading: Row(
          children: [
            SizedBox(width: 20.w),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 33.73.h,
                    width: 33.73.w,
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.16.r),
                        color: CustomizedTheme.colorAccent),
                    child: Icon(Icons.arrow_back, color: CustomizedTheme.white)),
              ),
            ),
          ],
        ),
        title: Text("Scan", style: CustomizedTheme.title_p_W500_21),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Step 1',
                  style: CustomizedTheme.title_p_W500_21,
                ),
              ),
              Text(
                'Choose your Document type',
                style: CustomizedTheme.sf_bo_W400_15,
              ),
              Row(
                children: [
                  Flexible(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Emirates ID",
                        style: CustomizedTheme.sf_bo_W400_15,
                      ),
                      value: 0,
                      groupValue: groupValue,
                      onChanged: (newVal) {
                        setState(
                          () {
                            emirateController.text = '';
                            groupValue = int.parse(newVal.toString());
                          },
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        "Passport",
                        style: CustomizedTheme.sf_bo_W400_15,
                      ),
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (newVal) {
                        setState(
                          () {
                            emirateController.text = '';
                            groupValue = int.parse(newVal.toString());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 43.04.h,
                  bottom: 32.h,
                ),
                child: Center(
                  child: SizedBox(
                    height: 154.h,
                    width: 154.w,
                    child: whichImage == "camera"
                        ? Image.file(
                            File(
                              _image!.path.toString(),
                            ),
                          )
                        : Image.asset(
                            'assets/icons/ic_scanner.png',
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Step 2',
                  style: CustomizedTheme.title_p_W500_21,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 18.h,
                ),
                child: Text(
                  groupValue == 1
                      ? 'Scan or upload your Passport '
                      : 'Scan or upload your Emirates ID',
                  style: CustomizedTheme.sf_bo_W400_15,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 61.07.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          color: CustomizedTheme.colorAccent),
                      child: TextButton(
                        onPressed: () {
                          // CustomAlertDialog.blueDialog(
                          //     context: context,
                          //     title: 'Successfully Scanned',
                          //     message: 'Your Emirates ID was succesfully scanned.',
                          //     buttonAction: (){
                          //     });
                          // Navigator.pushNamed(context, '/PhonePage');
                          _imgFromCamera();
                        },
                        child: Text(
                          "Scan",
                          style: CustomizedTheme.w_W500_19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Text('Or Please upload your Emirates ID/ Passport',style: CustomizedTheme.sf_bo_W400_15,),
              whichImage == "gallery"
                  ? Text(
                      _image!.name,
                      style: CustomizedTheme.sf_bo_W400_15,
                    )
                  : const SizedBox(),

              Padding(
                padding: EdgeInsets.only(
                  top: 29.h,
                  bottom: 42.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 61.07.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              7.r,
                            ),
                            color: CustomizedTheme.colorAccent),
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) => StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    insetPadding: EdgeInsets.zero,
                                    contentPadding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        15.r,
                                      ),
                                    ),
                                    title: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(_);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 18.h,
                                              right: 18.w,
                                              bottom: 10.w,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.clear,
                                                  color: CustomizedTheme
                                                      .primaryBold,
                                                  size: 18.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 56.w,
                                          ),
                                          child: Text(
                                            groupValue == 1
                                                ? 'Upload Passport'
                                                : 'Upload Emirates ID',
                                            style: CustomizedTheme
                                                .roboto_w_W500_16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    titlePadding:
                                        const EdgeInsetsDirectional.all(
                                      0,
                                    ),
                                    content: SizedBox(
                                      width: 0.8.sw,
                                      height: 210.58.h,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 0.4.sw,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 16.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                      8.r,
                                                    ),
                                                    topLeft: Radius.circular(
                                                      8.r,
                                                    ),
                                                  ),
                                                  border: Border.all(
                                                    color: CustomizedTheme
                                                        .colorAccentBlack,
                                                    width: 1.w,
                                                  ),
                                                ),
                                                child: whichImage == "gallery"
                                                    ? Text(
                                                        _image!.name,
                                                        style: CustomizedTheme
                                                            .sf_bo_W400_1592,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    : Text(
                                                        _image?.name ??
                                                            'Upload Photo',
                                                        style: CustomizedTheme
                                                            .sf_bo_W400_1592,
                                                      ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _getFromGallery();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 18.h,
                                                  ),
                                                  child: Text(
                                                    'Select File',
                                                    style: CustomizedTheme
                                                        .roboto_w_W400_14,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 30.h),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(_);
                                                // buttonAction.call();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    CustomizedTheme.colorAccent,
                                                minimumSize: Size(
                                                  0.5.sw,
                                                  50.h,
                                                ),
                                                // side: BorderSide(width: 1.0.w, color: CustomizedTheme.primaryColor),
                                                // shape: RoundedRectangleBorder(
                                                //   borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                                // ),
                                              ),
                                              child: Text(
                                                "Upload",
                                                style: CustomizedTheme
                                                    .sf_w_W400_17,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Upload",
                            style: CustomizedTheme.w_W500_19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Step 3',
                  style: CustomizedTheme.title_p_W500_21,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18.h),
                child: Text(
                  groupValue == 1
                      ? 'And Enter Passport'
                      : 'And Enter Emirates ID ',
                  style: CustomizedTheme.sf_bo_W400_15,
                ),
              ),
              SizedBox(
                height: 38.h,
              ),
              Form(
                key: Utils.passportKey,
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    groupValue == 0
                        ? EmiratesIdFormatter(
                            mask: 'xxx-xxxx-xxxxxxx-x',
                            separator: '-',
                          )
                        : UpperCaseTextFormatter(),
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 24.44.w,
                      right: 34.47.w,
                      bottom: 12.3.h,
                      top: 15.03.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0.r,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0.w,
                      ),
                    ),
                    labelText: groupValue == 1 ? 'Passport' : "Emirates ID",
                    labelStyle: CustomizedTheme.b_W400_12,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.0.r,
                        ),
                      ),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: emirateController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '';
                    }
                    // Return null if the entered email is valid
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 50.75.h,
                  bottom: 40.93.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 61.07.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              7.r,
                            ),
                            color: CustomizedTheme.colorAccent),
                        child: TextButton(
                          onPressed: () {
                            // CustomAlertDialog.blueDialog(
                            //     context: context,
                            //     title: 'Successfully Scanned',
                            //     message: 'Your Emirates ID was succesfully scanned.',
                            //     buttonAction: (){
                            //     });
                            if (Utils.passportKey.currentState!.validate() &&
                                _image!.path.isNotEmpty) {
                              Navigator.pushNamed(
                                context,
                                '/PhonePage',
                                arguments: RegisterTwo(
                                  firstName: widget.firstName,
                                  lastName: widget.lastName,
                                  nationality: widget.nationality,
                                  nationalityId: widget.nationalityId,
                                  phone: widget.phone,
                                  password: widget.password,
                                  areaCode: widget.areaCode,
                                  email: widget.email,
                                  eid: emirateController.text,
                                  image: File(_image!.path),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Next",
                            style: CustomizedTheme.w_W500_19,
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
}

class EmiratesIdFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  EmiratesIdFormatter({
    required this.mask,
    required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
