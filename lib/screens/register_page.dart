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
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentNationality = TextEditingController();
  String countryISO = '';
  List<String> localCountries = List.empty(growable: true);
  String currentAreaCode = '+971';
  bool allCompleted = false;

  @override
  void initState() {
    getCountries(countriesController.countries);
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
        title: Text("Register", style: CustomizedTheme.title_p_W500_21),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.36.w,
            vertical: 10.h,
          ),
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
                        labelText: "First Name",
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
                        labelText: "Last Name",
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
                      initialCountryCode: 'AE',
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0.r,
                          ),
                        ),
                      ),
                      onChanged: (phone) {},
                      onCountryChanged: (country) {
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                        labelText: "Nationality",
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
                            setState(() {
                              currentNationality.text = country.name;
                              countryISO = country.countryCode;
                            });
                          },
                          countryListTheme: CountryListThemeData(
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
                      height: 35.53.h,
                    ),

                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
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
                        labelText: "Password",
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
                          return '';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50.75.h),
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
                          if (Utils.registerFormKey.currentState!.validate()) {
                            // setState(() {
                            //   allCompleted = true;
                            // });
                            Navigator.pushNamed(context, '/ScanIDPage',
                                arguments: RegisterFirst(
                                  firstName: fnameController.text,
                                  lastName: lnameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  areaCode: '+$currentAreaCode',
                                  phone: phoneController.text,
                                  nationality: currentNationality.text,
                                  nationalityId: getNationalityId(countryISO),
                                ));
                          } else {}
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
