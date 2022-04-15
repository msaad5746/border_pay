import 'dart:convert';

import 'package:borderpay/Utils/sharedPrefKeys.dart';
import 'package:borderpay/Utils/sharedpref.dart';
import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/datamodels/bulk_vouchers_model.dart';
import 'package:borderpay/model/datamodels/countries_data_model.dart';
import 'package:borderpay/model/datamodels/create_bulk_voucher_model.dart';
import 'package:borderpay/model/datamodels/user_model.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo.dart';
import 'package:borderpay/repo/voucher_repo/voucher_repo_impl.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:borderpay/widget/custom_check_box.dart';
import 'package:borderpay/widget/spacer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DetailsTravelersPage extends StatefulWidget {
  final int travelerCount;
  final int locationId;
  final String type;

  const DetailsTravelersPage({
    Key? key,
    this.travelerCount = 1,
    this.locationId = -1,
    this.type = 'ENTRY',
  }) : super(key: key);

  @override
  _DetailsTravelersPageState createState() => _DetailsTravelersPageState();
}

class _DetailsTravelersPageState extends State<DetailsTravelersPage> {
  VoucherRepo networkHandler = VoucherRepoImpl();
  CountriesController countriesController = Get.find<CountriesController>();
  MySharedPreferences storage = MySharedPreferences.instance;
  List<String> localCountries = List.empty(growable: true);

  List<TextEditingController> firstNameCtrl = List.empty(growable: true);
  List<TextEditingController> lastNameCtrl = List.empty(growable: true);
  List<TextEditingController> phoneCtrl = List.empty(growable: true);
  List<TextEditingController> emailCtrl = List.empty(growable: true);
  List<TextEditingController> nationalityCtrl = List.empty(growable: true);
  List<TextEditingController> emiratesIdCtrl = List.empty(growable: true);
  List<int> nationalityId = List.empty(growable: true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var currentAreaCode;
  UserModel loginData = UserModel();

  bool isLoading = false;
  bool useMyDetail = false;

  @override
  void initState() {
    for (int i = 0; i <= widget.travelerCount; i++) {
      firstNameCtrl.add(TextEditingController());
      lastNameCtrl.add(TextEditingController());
      phoneCtrl.add(TextEditingController());
      emailCtrl.add(TextEditingController());
      nationalityCtrl.add(TextEditingController());
      emiratesIdCtrl.add(TextEditingController());
      nationalityId.add(0);
    }
    getCountries(countriesController.countries);
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer(60),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 37.26.h,
                  width: 37.26.w,
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.11.r,
                      ),
                      color: CustomizedTheme.colorAccent),
                  child: Icon(
                    Icons.arrow_back,
                    color: CustomizedTheme.white,
                  ),
                ),
              ),
              verticalSpacer(16),
              widget.travelerCount > 1
                  ? Text(
                      "Enter details of each traveller:",
                      style: CustomizedTheme.sf_b_W500_17,
                    )
                  : Text(
                      "Enter details of traveller:",
                      style: CustomizedTheme.sf_b_W500_17,
                    ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.travelerCount,
                itemBuilder: (context, index) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: 20.h),
                        //   child: Text('Traveller ${index +1}',style: CustomizedTheme.sf_b_W500_19,),
                        // ),
                        widget.travelerCount > 1 && index == 0
                            ? Row(
                                children: [
                                  Text(
                                    "Traveller ${index + 1}",
                                    style: CustomizedTheme.sf_b_W500_19,
                                  ),
                                  horizontalSpacer(24),
                                  useMyDetail
                                      ? CustomCheckBox(
                                          onTap: () {
                                            useMyDetail = !useMyDetail;
                                            if (useMyDetail) {
                                              filledUserDetails();
                                            } else {
                                              unfilledUserDetails();
                                            }
                                            setState(() {});
                                          },
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            useMyDetail = !useMyDetail;
                                            if (useMyDetail) {
                                              filledUserDetails();
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: horizontalValue(7.5),
                                              vertical: verticalValue(7.5),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                  horizontalSpacer(16),
                                  Text(
                                    'Your existing details will be utilised',
                                    style: CustomizedTheme.roboto_l_W400_10,
                                  ),
                                ],
                              )
                            : widget.travelerCount > 1
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 30.h),
                                    child: Text("Traveller ${index + 1}",
                                        style: CustomizedTheme.sf_b_W500_19),
                                  )
                                : const SizedBox.shrink(),
                        verticalSpacer(16),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 20.h,
                          ),
                          child: TextFormField(
                            controller: firstNameCtrl[index],
                            showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 30.45.w,
                                right: 44.45.w,
                                top: 23.66.h,
                                bottom: 23.66.h,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                  color: CustomizedTheme.colorAccent,
                                  width: .01.w,
                                ),
                              ),
                              labelText: "First Name",
                              labelStyle:
                                  TextStyle(color: CustomizedTheme.colorAccent),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            // controller: personController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // Return null if the entered email is valid
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter a first name';
                              }
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextFormField(
                            controller: lastNameCtrl[index],
                            showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 30.45.w,
                                right: 44.45.w,
                                top: 23.66.h,
                                bottom: 23.66.h,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: CustomizedTheme.colorAccent,
                                  width: .01.w,
                                ),
                              ),
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                color: CustomizedTheme.colorAccent,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            // controller: personController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // Return null if the entered email is valid
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                          ),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: IntlPhoneField(
                                controller: phoneCtrl[index],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 30.45.w,
                                    right: 10.45.w,
                                    top: 23.66.h,
                                    bottom: 23.66.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10.0.r,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: CustomizedTheme.colorAccent,
                                      width: .01.w,
                                    ),
                                  ),
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10.0.r,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.lightBlue,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        10.0.r,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.lightBlue,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                onChanged: (phone) {},
                                onCountryChanged: (country) {
                                  setState(
                                    () {
                                      currentAreaCode = country.dialCode;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
                          ),
                          child: TextFormField(
                            controller: emailCtrl[index],
                            showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 30.45.w,
                                  right: 44.45.w,
                                  top: 23.66.h,
                                  bottom: 23.66.h),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0.r)),
                                  borderSide: BorderSide(
                                      color: CustomizedTheme.colorAccent,
                                      width: .01.w)),
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: CustomizedTheme.colorAccent),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 1.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 1.w),
                              ),
                            ),
                            // controller: personController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // Return null if the entered email is valid
                            validator: (value) {
                              if (!GetUtils.isEmail(value!)) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextFormField(
                            readOnly: true,
                            controller: nationalityCtrl[index],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (nationalityCtrl[index].text.isEmpty) {
                                return 'invalid Nationality';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 30.45.w,
                                  right: 44.45.w,
                                  top: 23.66.h,
                                  bottom: 23.66.h),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0.r)),
                                  borderSide: BorderSide(
                                      color: CustomizedTheme.colorAccent,
                                      width: .01.w)),
                              labelText: "Nationality",
                              labelStyle:
                                  TextStyle(color: CustomizedTheme.colorAccent),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 1.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0.r)),
                                borderSide: BorderSide(
                                    color: Colors.lightBlue, width: 1.w),
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
                                  nationalityId[index] =
                                      getNationalityId(country.countryCode);
                                  print(
                                      'Select country: ${country.displayName}');
                                  setState(() {
                                    nationalityCtrl[index].text = country.name;
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
                                    prefixIcon: const Icon(
                                      Icons.search,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(
                                          0xFF8C98A8,
                                        ).withOpacity(
                                          0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: TextFormField(
                            controller: emiratesIdCtrl[index],
                            showCursor: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 30.45.w,
                                right: 44.45.w,
                                top: 23.66.h,
                                bottom: 23.66.h,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: CustomizedTheme.colorAccent,
                                  width: .01.w,
                                ),
                              ),
                              labelText: "Emirates ID/Passport Number",
                              labelStyle: TextStyle(
                                color: CustomizedTheme.colorAccent,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0.r,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 1.w,
                                ),
                              ),
                            ),
                            // controller: personController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // Return null if the entered email is valid
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter a Emirates ID/Passport Number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: 154.94,
                      height: 56.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.72.r),
                        border: Border.all(
                          color: CustomizedTheme.primaryColor,
                          width: .5.w,
                        ),
                        color: CustomizedTheme.white,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CustomizedTheme.colorAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(
                              () {
                                isLoading = true;
                              },
                            );
                            List<BulkTraveler> travelersData =
                                List.empty(growable: true);
                            for (int i = 0; i < widget.travelerCount; i++) {
                              travelersData.add(
                                BulkTraveler(
                                  firstName: firstNameCtrl[i].text,
                                  lastName: lastNameCtrl[i].text,
                                  mobileNumber: currentAreaCode.toString() +
                                      phoneCtrl[i].text,
                                  email: emailCtrl[i].text,
                                  nationalityId: nationalityId[i],
                                  emirateId: emiratesIdCtrl[i].text,
                                ),
                              );
                            }
                            CreateBulkVoucherModel body =
                                CreateBulkVoucherModel(
                              widget.type,
                              widget.locationId,
                              travelersData,
                            );

                            var res =
                                await networkHandler.createBulkVoucher(body, 1);
                            if (res != null) {
                              setState(() {
                                isLoading = false;
                              });
                              BulkVouchersModel voucher = BulkVouchersModel(
                                res.status,
                                res.statusMsg,
                                res.data,
                              );

                              Navigator.pushNamed(
                                context,
                                widget.travelerCount == 1
                                    ? '/SingleVoucher'
                                    : '/PaymentSummary',
                                arguments: voucher.data.vouchers,
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text("Something went wrong"),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: CustomizedTheme.voucherUnpaid,
                              ));
                            }
                            setState(
                              () {
                                isLoading = false;
                              },
                            );
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Next",
                                style: CustomizedTheme.sf_w_W500_19,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacer(32),
            ],
          ),
        ),
      ),
    );
  }

  void getCountries(List<CountryDetails> countries) {
    if (countries.isNotEmpty) {
      for (var element in countries) {
        localCountries.add(element.iso);
      }
    }
  }

  int getNationalityId(String countryCode) {
    int index = (countriesController.countries
        .indexWhere((element) => element.iso == countryCode));
    return countriesController.countries[index].id;
  }

  String getNationalityName(int? id) {
    if (id != null) {
      int index = countriesController.countries
          .indexWhere((element) => element.id == id);
      return countriesController.countries[index].name;
    }
    return '';
  }

  getUserData() {
    bool isUserExist = storage.containsKey(SharedPrefKeys.user);
    if (isUserExist) {
      String user = storage.getStringValue(SharedPrefKeys.user);
      loginData = UserModel.fromJson(json.decode(user)['data']);
    }
  }

  void filledUserDetails() {
    firstNameCtrl[0].text = loginData.firstName;
    lastNameCtrl[0].text = loginData.lastName;
    phoneCtrl[0].text = loginData.phoneNumber;
    emailCtrl[0].text = loginData.email;
    nationalityCtrl[0].text = getNationalityName(loginData.nationality?.id);
    emiratesIdCtrl[0].text = loginData.emirateId;
    nationalityId[0] = loginData.nationality?.id ?? 0;
  }

  void unfilledUserDetails() {
    firstNameCtrl[0].text = '';
    lastNameCtrl[0].text = '';
    phoneCtrl[0].text = '';
    emailCtrl[0].text = '';
    nationalityCtrl[0].text = '';
    emiratesIdCtrl[0].text = '';
    nationalityId[0] = 0;
  }
}
