import 'dart:io';

import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/register_controller.dart';
import 'package:borderpay/model/arguments/register_datatoserver.dart';
import 'package:borderpay/model/datamodels/login_user_model.dart';
import 'package:borderpay/model/datamodels/register_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:borderpay/response/register_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhonePage extends StatefulWidget {
  String firstName;
  String lastName;
  String phone;
  String password;
  String areaCode;
  String email;
  String nationality;
  int nationalityId;
  String eid;
  File image;

  PhonePage(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.areaCode,
      required this.email,
      required this.password,
      required this.nationality,
      required this.nationalityId,
      required this.eid,
      required this.image})
      : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  AuthRepo networkHandler = AuthRepoImpl();
  TextEditingController phoneController = TextEditingController();
  RegisterController registerController = Get.put(RegisterController());
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      phoneController.text = widget.areaCode + widget.phone;
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 33.73,
        leading: Center(
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
        title: Text("Phone Number", style: CustomizedTheme.title_p_W500_21),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm your phone number below',
              style: CustomizedTheme.sf_bo_W400_15,
            ),
            SizedBox(
              height: 48.h,
            ),
            TextFormField(
              readOnly: true,
              keyboardType: TextInputType.number,
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
                labelText: "Phone Number",
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
              controller: phoneController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return '';
                }
                // Return null if the entered email is valid
                return null;
              },
            ),
            SizedBox(height: 50.75.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 61.07.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        7.r,
                      ),
                      color: CustomizedTheme.colorAccent,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (phoneController.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });
                          RegisterDataServer register = RegisterDataServer(
                            firstName: widget.firstName,
                            lastName: widget.lastName,
                            nationality: widget.nationality,
                            nationalityId: widget.nationalityId,
                            phone: phoneController.text,
                            password: widget.password,
                            areaCode: widget.areaCode,
                            email: widget.email,
                            emiratedpassport: widget.eid,
                          );
                          RegisterResponse response =
                              await networkHandler.registerUser(
                            register,
                          );
                          if (response.statusCode == 201) {
                            setState(
                              () {
                                isLoading = false;
                              },
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  "OTP Sended",
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: CustomizedTheme.voucherPaid,
                              ),
                            );

                            Navigator.pushNamed(
                              context,
                              '/otp',
                              arguments: RegisterDataServer(
                                  firstName: widget.firstName,
                                  lastName: widget.lastName,
                                  nationality: widget.nationality,
                                  nationalityId: widget.nationalityId,
                                  phone: widget.phone,
                                  password: widget.password,
                                  areaCode: widget.areaCode,
                                  email: widget.email,
                                  emiratedpassport: widget.eid
                                  // image: File(
                                  //   widget.image.path,
                                  // ),
                                  ),
                            );
                          } else {
                            setState(
                              () {
                                isLoading = false;
                              },
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  response.statusMsg!,
                                  textAlign: TextAlign.center,
                                  style: CustomizedTheme.w_W500_15.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: CustomizedTheme.white,
                                  )
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: CustomizedTheme.voucherUnpaid,
                              ),
                            );
                          }
                        }
                      },
                      child: isLoading == false
                          ? Text(
                              "Next",
                              style: CustomizedTheme.w_W500_19,
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
