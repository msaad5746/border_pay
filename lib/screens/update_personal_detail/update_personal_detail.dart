import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/arguments/register_first.dart';
import 'package:borderpay/model/datamodels/countries_data_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserModel userData;

  const UpdateProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  CountriesController countriesController = Get.find<CountriesController>();
  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController currentNationality;

  String countryISO = '';
  List<String> localCountries = List.empty(growable: true);
  var currentAreaCode;
  bool isLoading = false;

  @override
  void initState() {
    getCountries(countriesController.countries);

    fnameController = TextEditingController(text: widget.userData.firstName);
    lnameController = TextEditingController(text: widget.userData.lastName);
    phoneController = TextEditingController();
    emailController = TextEditingController(text: widget.userData.email);
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
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 33.73.h,
                  width: 33.73.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.16.r),
                      color: CustomizedTheme.colorAccent),
                  child: Icon(Icons.arrow_back, color: CustomizedTheme.white)),
            ),
          ),
          title: Text("Update Profile", style: CustomizedTheme.title_p_W500_21),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.36.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: Utils.registerFormKey,
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
                              top: 15.03.h),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.0.w)),
                          labelText: "First Name",
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
                            return '';
                          }
                          // Check if the entered email has the right format
                          // if (value.trim().length < 6) {
                          //   return 'Enter correct password';
                          // }
                          // Return null if the entered email is valid
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
                              top: 15.03.h),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.0.w)),
                          labelText: "Last Name",
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
                            return '';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 35.53.h,
                      ),
                      // buildPhoneDD(),
                      IntlPhoneField(
                        // initialCountryCode: ,
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.r)),
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                          print('dialCode changed to: ' + country.dialCode);
                          setState(() {
                            currentAreaCode = country.dialCode;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        height: 25.53.h,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 24.44.w,
                              right: 34.47.w,
                              bottom: 12.3.h,
                              top: 15.03.h),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.0.w)),
                          labelText: "Email ID",
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
                          if (!GetUtils.isEmail(value!)) {
                            return '';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 35.53.h,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: currentNationality,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 24.44.w,
                              right: 34.47.w,
                              bottom: 12.3.h,
                              top: 15.03.h),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0.r)),
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.0.w)),
                          labelText: "Nationality",
                          labelStyle: CustomizedTheme.b_W400_12,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            // exclude: <String>['KN', 'MF'],
                            //Optional. Shows phone code before the country name.
                            countryFilter: localCountries,
                            showPhoneCode: false,
                            showWorldWide: false,
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              setState(() {
                                currentNationality.text = country.name;
                                countryISO = country.countryCode;
                              });
                            },
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              // Optional. Sets the border radius for the bottomsheet.
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: 85.53.h,
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
                            borderRadius: BorderRadius.circular(7.r),
                            color: CustomizedTheme.colorAccent),
                        child: TextButton(
                            onPressed: () {
                              if (Utils.registerFormKey.currentState!
                                  .validate()) {
                              } else {
                                print("Invalid");
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Update",
                                    style: CustomizedTheme.w_W500_19)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void getCountries(List<CountryDetails> countries) {
    if (countries.isNotEmpty) {
      countries.forEach((element) {
        localCountries.add(element.iso);
      });
    }
  }

  getNationalityId(String iso) {
    if (countryISO.isNotEmpty) {
      int index = localCountries.indexWhere((element) => element == iso);
      return countriesController.countries[index].id;
    }
    return 1;
  }

  String getNationalityName(int? id) {
    if (id != null) {
      int index = countriesController.countries
          .indexWhere((element) => element.id == id);
      return countriesController.countries[index].name;
    }
    return '';
  }
}
