import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/controllers/countries_controller.dart';
import 'package:borderpay/model/arguments/register_first.dart';
import 'package:borderpay/model/datamodels/countries_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CountriesController countriesController = Get.find<CountriesController>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentNationality = TextEditingController();
  String countryISO = '';
  List<String> localCountries = List.empty(growable: true);
  var currentAreaCode;

  // var currentNationality;
  bool allCompleted = false;

  @override
  void initState() {
    // countriesController.fetchCountries();
    getCountries(countriesController.countries);
    super.initState();
  }

  Future fetchCountry() async {
    // await countriesController.fetchCountries();
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
          title: Text("Register", style: CustomizedTheme.title_p_W500_21),
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
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: IntlPhoneField(
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.r)),
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
                                // FormField(
                                //   builder: (FormFieldState state) {
                                //     return InputDecorator(
                                //       decoration: InputDecoration(
                                //           contentPadding: EdgeInsets.only(left: 10.w, bottom: 12.3.h,top: 15.03.h),
                                //           // label: Text('Nationality',style: TextStyle(color: Colors.black),),
                                //           // labelStyle: CustomizedTheme.sf_b_W400_17,
                                //           // hintStyle: CustomizedTheme.sf_b_W400_17,
                                //           // hintText: 'Nationality',
                                //           filled: true,
                                //           fillColor: CustomizedTheme.primaryBold,
                                //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.r))),
                                //       // isEmpty: _currentSelectedValue == '' ? false:true,
                                //       child: DropdownButtonHideUnderline(
                                //         child: DropdownButton(
                                //           dropdownColor:CustomizedTheme.primaryBold,
                                //           iconEnabledColor: CustomizedTheme.white,
                                //           style: CustomizedTheme.w_W300_12,
                                //           isExpanded: true,
                                //           borderRadius: BorderRadius.circular(10.r),
                                //           menuMaxHeight: 200.h,
                                //           value: currentAreaCode,
                                //           isDense: true,
                                //           onChanged: (newValue) {
                                //             setState(() {
                                //               currentAreaCode = newValue;
                                //             });
                                //           },
                                //           items: countriesController.countriesDataList.value.response!.detail.purchasedCoins.map((value) {
                                //             return DropdownMenuItem(
                                //               value: value.phonecode,
                                //               child: FittedBox(
                                //                 child: Row(
                                //                   children: [
                                //                     Image.network(value.flag,height: 19.h,width: 29.w,),
                                //                     SizedBox(width: 5.w,),
                                //                     Text(value.iso,overflow: TextOverflow.ellipsis),
                                //                   ],
                                //                 ),
                                //               ),
                                //             );
                                //           }).toList(),
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              // Expanded(
                              //   flex: 3,
                              //   child: TextFormField(
                              //     controller: phoneController,
                              //     keyboardType: TextInputType.phone,
                              //     decoration: InputDecoration(
                              //       contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                              //       border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                              //           borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                              //       labelText: "Phone Number",
                              //       labelStyle: CustomizedTheme.b_W400_12,
                              //       focusedBorder:  OutlineInputBorder(
                              //         borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                              //         borderSide: BorderSide(color: Colors.black),
                              //       ),
                              //     ),
                              //     // controller: passwordController,
                              //     autovalidateMode: AutovalidateMode.onUserInteraction,
                              //     validator: (value) {
                              //       if (value!.trim().isEmpty) {
                              //         return '';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),
                            ],
                          )
                              // DropdownSearch<PurchasedCoin>(
                              //     mode: Mode.MENU,
                              //     // showSelectedItems: true,
                              //     items: countriesController.countriesDataList.value.response!.detail.purchasedCoins,
                              //     label: "Menu mode",
                              //     hint: "country in menu mode",
                              //     // popupItemDisabled: (s) => s.toString().startsWith('I'),
                              //     onChanged: print,
                              //     // selectedItem: "Brazil"
                              // ),
                              ),
                          SizedBox(
                            width: 5.w,
                          ),

                          /// phone
                          // Expanded(
                          //   // flex: 1,
                          //   child: TextFormField(
                          //     controller: phoneController,
                          //     keyboardType: TextInputType.phone,
                          //     decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          //           borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
                          //       labelText: "Phone Number",
                          //       labelStyle: CustomizedTheme.b_W400_12,
                          //       focusedBorder:  OutlineInputBorder(
                          //         borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                          //         borderSide: BorderSide(color: Colors.black),
                          //       ),
                          //     ),
                          //     // controller: passwordController,
                          //     autovalidateMode: AutovalidateMode.onUserInteraction,
                          //     validator: (value) {
                          //       if (value!.trim().isEmpty) {
                          //         return '';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),

                          // DropdownSearch.multiSelection(
                          //     mode: Mode.MENU,
                          //     // showSelectedItems: true,
                          //     items: countriesController.countriesDataList.value.response!.detail.purchasedCoins,
                          //     label: "Menu mode",
                          //     hint: "country in menu mode",
                          //     // popupItemDisabled: (s) => s.toString().startsWith('I'),
                          //     onChanged: print,
                          //     // selectedItems: ["Brazil"]
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 35.53.h,
                      ),
                      TextFormField(
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
                      // FormField(
                      //   builder: (FormFieldState state) {
                      //     return InputDecorator(
                      //       decoration: InputDecoration(
                      //           contentPadding: EdgeInsets.only(left: 24.44.w,right: 24.44.w, bottom: 12.3.h,top: 15.03.h),
                      //           label: Text('Nationality',style: TextStyle(color: Colors.black),),
                      //           labelStyle: CustomizedTheme.sf_b_W400_17,
                      //           hintStyle: CustomizedTheme.sf_b_W400_17,
                      //           hintText: 'Nationality',
                      //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.r))),
                      //       // isEmpty: _currentSelectedValue == '' ? false:true,
                      //       child: DropdownButtonHideUnderline(
                      //         child: DropdownButton(
                      //           isExpanded: true,
                      //           borderRadius: BorderRadius.circular(10.r),
                      //           menuMaxHeight: 200.h,
                      //           value: currentNationality,
                      //           isDense: true,
                      //           onChanged: (newValue) {
                      //             setState(() {
                      //               currentNationality = newValue;
                      //             });
                      //           },
                      //           items: countriesController.countriesDataList.value.response!.detail.purchasedCoins.map((value) {
                      //             return DropdownMenuItem(
                      //               value: value.nicename,
                      //               child: FittedBox(
                      //                 child: Row(
                      //                   children: [
                      //                     Image.network(value.flag,height: 19.h,width: 29.w,),
                      //                     SizedBox(width: 2.w,),
                      //                     Text(value.nicename,overflow: TextOverflow.ellipsis),
                      //                   ],
                      //                 ),
                      //               ),
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      TextFormField(
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

                      SizedBox(height: 129.75.h),
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
                                // setState(() {
                                //   allCompleted = true;
                                // });
                                Navigator.pushNamed(context, '/ScanIDPage',
                                    arguments: RegisterFirst(
                                      firstName: fnameController.text,
                                      lastName: lnameController.text,
                                      email: emailController.text,
                                      areaCode: currentAreaCode,
                                      phone: phoneController.text,
                                      nationality: currentNationality.text,
                                      nationalityId:
                                          getNationalityId(countryISO),
                                    ));
                                print(emailController.text +
                                    fnameController.text +
                                    lnameController.text +
                                    "AREA CODE" +
                                    currentAreaCode.toString() +
                                    "PHONE" +
                                    phoneController.text +
                                    currentNationality.toString());
                              } else {
                                print("Invalid");
                              }
                            },
                            child:
                                Text("Next", style: CustomizedTheme.w_W500_19)),
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

// Widget buildPhoneDD() {
//   return Row(
//                   children: [
//                     Expanded(
//                       child: FormField(
//                         builder: (FormFieldState state) {
//                           return InputDecorator(
//                             decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.only(left: 10.w, bottom: 12.3.h,top: 15.03.h),
//                                 // label: Text('Nationality',style: TextStyle(color: Colors.black),),
//                                 // labelStyle: CustomizedTheme.sf_b_W400_17,
//                                 // hintStyle: CustomizedTheme.sf_b_W400_17,
//                                 // hintText: 'Nationality',
//                                 filled: true,
//                                 fillColor: CustomizedTheme.primaryBold,
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.r))),
//                             // isEmpty: _currentSelectedValue == '' ? false:true,
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton(
//                                 dropdownColor:CustomizedTheme.primaryBold,
//                                 iconEnabledColor: CustomizedTheme.white,
//                                 style: CustomizedTheme.w_W300_12,
//                                 isExpanded: true,
//                                 borderRadius: BorderRadius.circular(10.r),
//                                 menuMaxHeight: 200.h,
//                                 value: currentAreaCode,
//                                 isDense: true,
//                                 onChanged: (newValue) {
//                                   setState(() {
//                                     currentAreaCode = newValue;
//                                   });
//                                 },
//                                 items: countriesController.countriesDataList.value.response!.detail.purchasedCoins.map((value) {
//                                   return DropdownMenuItem(
//                                     value: value.phonecode,
//                                     child: FittedBox(
//                                       child: Row(
//                                         children: [
//                                           Image.network(value.flag,height: 19.h,width: 29.w,),
//                                           SizedBox(width: 5.w,),
//                                           Text(value.iso,overflow: TextOverflow.ellipsis),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 5.w,),
//                     Expanded(
//                       flex: 3,
//                       child: TextFormField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 24.44.w,right: 34.47.w, bottom: 12.3.h,top: 15.03.h),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
//                               borderSide: BorderSide(color: Colors.black,width: 1.0.w)),
//                           labelText: "Phone Number",
//                           labelStyle: CustomizedTheme.b_W400_12,
//                           focusedBorder:  OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
//                             borderSide: BorderSide(color: Colors.black),
//                           ),
//                         ),
//                         // controller: passwordController,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         validator: (value) {
//                           if (value!.trim().isEmpty) {
//                             return '';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 );
// }

}
