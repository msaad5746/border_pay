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
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
            child: BlueBackButton(
          context: context,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: widget.travelerCount > 1
                    ? const Text("Enter details of each traveller:")
                    : Text("Enter details of traveller:",
                        style: CustomizedTheme.sf_b_W500_17),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.travelerCount,
                  itemBuilder: (context, index) {
                    return Form(
                      // key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.symmetric(vertical: 20.h),
                          //   child: Text('Traveller ${index +1}',style: CustomizedTheme.sf_b_W500_19,),
                          // ),
                          widget.travelerCount > 1 && index == 0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 20.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text("Traveller ${index + 1}",
                                            style:
                                                CustomizedTheme.sf_b_W500_19),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CheckboxListTile(
                                          checkColor: CustomizedTheme.white,
                                          activeColor:
                                              CustomizedTheme.primaryBold,
                                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0.h, horizontal: 0.w),
                                          value: useMyDetail,
                                          onChanged: (value) {
                                            useMyDetail = !useMyDetail;
                                            if (value != null && value) {
                                              filledUserDetails();
                                              setState(() {});
                                            } else {
                                              unfilledUserDetails();
                                              setState(() {});
                                            }
                                          },
                                          title: Text(
                                            'Your existing details will be utilised',
                                            style: CustomizedTheme
                                                .roboto_l_W400_10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : widget.travelerCount > 1
                                  ? Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),
                                      child: Text("Traveller ${index + 1}",
                                          style: CustomizedTheme.sf_b_W500_19),
                                    )
                                  : const SizedBox.shrink(),
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
                                    bottom: 23.66.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.r)),
                                    borderSide: BorderSide(
                                        color: CustomizedTheme.colorAccent,
                                        width: .01.w)),
                                labelText: "First Name",
                                labelStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent),
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
                                    bottom: 23.66.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.r)),
                                    borderSide: BorderSide(
                                        color: CustomizedTheme.colorAccent,
                                        width: .01.w)),
                                labelText: "Last Name",
                                labelStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent),
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
                                flex: 2,
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
                                            Radius.circular(10.0.r)),
                                        borderSide: BorderSide(
                                            color: CustomizedTheme.colorAccent,
                                            width: .01.w)),
                                    hintText: "Phone Number",
                                    hintStyle: TextStyle(
                                        color: CustomizedTheme.colorAccent),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0.r)),
                                      borderSide: BorderSide(
                                          color: Colors.lightBlue, width: 1.w),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0.r)),
                                      borderSide: BorderSide(
                                          color: Colors.lightBlue, width: 1.w),
                                    ),
                                  ),
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                  onCountryChanged: (country) {
                                    print(
                                        'Country changed to: ' + country.name);
                                    print('dialCode changed to: ' +
                                        country.dialCode);
                                    setState(() {
                                      currentAreaCode = country.dialCode;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.r)),
                                    borderSide: BorderSide(
                                        color: CustomizedTheme.colorAccent,
                                        width: .01.w)),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.r)),
                                    borderSide: BorderSide(
                                        color: CustomizedTheme.colorAccent,
                                        width: .01.w)),
                                labelText: "Nationality",
                                labelStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent),
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
                                      nationalityCtrl[index].text =
                                          country.name;
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
                                    bottom: 23.66.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0.r)),
                                    borderSide: BorderSide(
                                        color: CustomizedTheme.colorAccent,
                                        width: .01.w)),
                                labelText: "Emirates ID/Passport Number",
                                labelStyle: TextStyle(
                                    color: CustomizedTheme.colorAccent),
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // width: 154.94,
                        height: 56.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.72.r),
                            border: Border.all(
                                color: CustomizedTheme.primaryColor,
                                width: .5.w),
                            color: CustomizedTheme.white),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomizedTheme.colorAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                            onPressed: () async {
                              // if (Utils.travelerDetailsKey.currentState!
                              //     .validate()) {
                              setState(() {
                                isLoading = true;
                              });
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

                              var res = await networkHandler.createBulkVoucher(
                                  body, 1);
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
                                  backgroundColor:
                                      CustomizedTheme.voucherUnpaid,
                                ));
                              }
                              setState(() {
                                isLoading = false;
                              });
                              // }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text("Next",
                                    style: CustomizedTheme.sf_w_W500_19)),
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

  void getCountries(List<CountryDetails> countries) {
    if (countries.isNotEmpty) {
      countries.forEach((element) {
        localCountries.add(element.iso);
      });
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
