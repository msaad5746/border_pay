import 'package:borderpay/Route_Constants/route_constants.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/countries_data_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/auth_repo/auth_repo.dart';
import 'package:borderpay/repo/auth_repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import '../../localization/app_localization.dart';
import '../../localization/translation_keys.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserModel userData;

  const UpdateProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  CountriesController countriesController = Get.find<CountriesController>();
  AuthRepo networkHandler = AuthRepoImpl();
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController emirateController;
  late TextEditingController currentNationality;

  String countryISO = '';
  List<String> localCountries = List.empty(growable: true);
  bool isLoading = false;

  @override
  void initState() {
    getCountries(countriesController.countries);

    fnameController = TextEditingController(text: widget.userData.firstName);
    lnameController = TextEditingController(text: widget.userData.lastName);
    emirateController = TextEditingController(text: widget.userData.emirateId);
    currentNationality = TextEditingController(
        text: getNationalityName(widget.userData.nationality?.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 20.w),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, false);
                },
                child: Container(
                  height: 33.73.h,
                  width: 33.73.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      9.16.r,
                    ),
                    color: CustomizedTheme.colorAccent,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: CustomizedTheme.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          AppLocalizations.of(context)!.translate(
            TranslationKeys.updateProfile,
          ),
          style: CustomizedTheme.title_p_W500_21,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: Utils.updateFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: fnameController,
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
                        labelText: AppLocalizations.of(context)!.translate(
                          TranslationKeys.firstName,
                        ),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppLocalizations.of(context)!.translate(
                            TranslationKeys.firstNameIsEmpty,
                          );
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 35.53.h,
                    ),
                    TextFormField(
                      controller: lnameController,
                      keyboardType: TextInputType.name,
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
                        labelText: AppLocalizations.of(context)!.translate(
                          TranslationKeys.lastName,
                        ),
                        labelStyle: CustomizedTheme.b_W400_12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return AppLocalizations.of(context)!.translate(
                            TranslationKeys.lastNameIsEmpty,
                          );
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 35.53.h,
                    ),
                    TextFormField(
                      controller: emirateController,
                      keyboardType: TextInputType.text,
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
                        labelText: AppLocalizations.of(context)!.translate(
                          TranslationKeys.emiratesID,
                        ),
                        labelStyle: CustomizedTheme.b_W400_12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0.r)),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      // controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return AppLocalizations.of(context)!.translate(
                            TranslationKeys.enterEmirateID,
                          );
                        }
                        // Return null if the id is valid
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 35.53.h,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: currentNationality,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return AppLocalizations.of(context)!.translate(
                            TranslationKeys.nationalityIsEmpty,
                          );
                        }
                        return null;
                      },
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
                        labelText: AppLocalizations.of(context)!.translate(
                          TranslationKeys.nationality,
                        ),
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
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryFilter: localCountries,
                          showPhoneCode: false,
                          showWorldWide: false,
                          onSelect: (Country country) {
                            setState(
                              () {
                                currentNationality.text = country.name;
                                countryISO = country.countryCode;
                              },
                            );
                          },
                          countryListTheme: CountryListThemeData(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                40.0,
                              ),
                              topRight: Radius.circular(
                                40.0,
                              ),
                            ),
                            // Optional. Styles the search field.
                            inputDecoration: InputDecoration(
                              labelText:
                                  AppLocalizations.of(context)!.translate(
                                TranslationKeys.search,
                              ),
                              hintText: AppLocalizations.of(context)!.translate(
                                TranslationKeys.startTypingToSearch,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 45.53.h,
                    ),
                  ],
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
                        color: CustomizedTheme.colorAccent,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (fnameController.text ==
                                  widget.userData.firstName &&
                              lnameController.text ==
                                  widget.userData.lastName &&
                              emirateController.text ==
                                  widget.userData.emirateId &&
                              getNationalityId() ==
                                  widget.userData.nationality!.id) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  AppLocalizations.of(context)!.translate(
                                    TranslationKeys.nothingToUpdate,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: CustomizedTheme.b_W400_12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: CustomizedTheme.white,
                                  ),
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: CustomizedTheme.voucherUnpaid,
                              ),
                            );
                          } else {
                            if (Utils.updateFormKey.currentState!.validate()) {
                              updateUser();
                            }
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                AppLocalizations.of(context)!.translate(
                                  TranslationKeys.update,
                                ),
                                style: CustomizedTheme.w_W500_19,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCountries(List<CountryDetails> countries) {
    if (countries.isNotEmpty) {
      countries.forEach((element) {
        localCountries.add(element.iso);
      });
    }
  }

  getNationalityId() {
    if (countryISO.isNotEmpty) {
      int index = localCountries.indexWhere((element) => element == countryISO);
      return countriesController.countries[index].id;
    }
    return widget.userData.nationality?.id;
  }

  String getNationalityName(int? id) {
    if (id != null) {
      int index = countriesController.countries
          .indexWhere((element) => element.id == id);
      return countriesController.countries[index].name;
    }
    return '';
  }

  updateUser() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> loginData = {
      "firstName": fnameController.text,
      "lastName": lnameController.text,
      "nationalityId": getNationalityId(),
      "email": widget.userData.email,
      "emirateId": emirateController.text,
    };
    var res = await networkHandler.updateUserDetails(
      widget.userData.userId,
      loginData,
    );
    if (res != null) {
      await networkHandler.getUserDetails(widget.userData.userId);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate(
              TranslationKeys.successfullyUpdated,
            ),
            textAlign: TextAlign.center,
            style: CustomizedTheme.b_W400_12.copyWith(
              fontWeight: FontWeight.w400,
              color: CustomizedTheme.white,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: CustomizedTheme.voucherPaid,
        ),
      );
      Navigator.pop(context, true);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.translate(
              TranslationKeys.somethingWentWrong,
            ),
            textAlign: TextAlign.center,
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
}
