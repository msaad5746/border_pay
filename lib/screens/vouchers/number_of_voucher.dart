import 'package:borderpay/app_theme/theme.dart';
import 'package:borderpay/model/arguments/traveler_details_arguments.dart';
import 'package:borderpay/widget/blue_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberofVoucherPage extends StatefulWidget {
  final String type;
  final int locationId;

  const NumberofVoucherPage({
    Key? key,
    required this.type,
    required this.locationId,
  }) : super(key: key);

  @override
  _NumberofVoucherPageState createState() => _NumberofVoucherPageState();
}

class _NumberofVoucherPageState extends State<NumberofVoucherPage> {
  TextEditingController numberController = TextEditingController();
  int selection = 0;

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.36.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Text("Select the Number of Travellers",
                    style: CustomizedTheme.sf_b_W500_17),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: TextFormField(
                  showCursor: true,
                  readOnly: true,
                  controller: numberController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 30.45.w,
                        right: 44.45.w,
                        top: 23.66.h,
                        bottom: 23.66.h),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                        borderSide: BorderSide(
                            color: CustomizedTheme.colorAccent, width: .01)),
                    labelText: "Number of Travellers",
                    labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 1.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
                      borderSide:
                          BorderSide(color: Colors.lightBlue, width: 1.w),
                    ),
                  ),
                  // controller: personController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // Return null if the entered email is valid
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter a number';
                    }
                    if (value.trim().length > 9) {
                      return 'You can pay up for 9 people';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selection == 2
                            ? CustomizedTheme.primaryBold
                            : CustomizedTheme.white,
                        minimumSize: Size(50.w, 50.h),
                        side: BorderSide(
                            width: 1.0.w, color: CustomizedTheme.primaryBold),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      onPressed: () {
                        setState(() {
                          selection = 2;
                          numberController.text = selection.toString();
                        });
                      },
                      child: Text("2",
                          style: selection != 2
                              ? CustomizedTheme.sf_b_W500_19
                              : CustomizedTheme.sf_w_W500_19)),
                  const SizedBox(width: 15),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selection == 3
                            ? CustomizedTheme.primaryBold
                            : CustomizedTheme.white,
                        minimumSize: Size(50.w, 50.h),
                        side: BorderSide(
                            width: 1.0, color: CustomizedTheme.primaryBold),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      onPressed: () {
                        setState(() {
                          selection = 3;
                          numberController.text = selection.toString();
                        });
                      },
                      child: Text("3",
                          style: selection != 3
                              ? CustomizedTheme.sf_b_W500_19
                              : CustomizedTheme.sf_w_W500_19)),
                  const SizedBox(width: 15),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selection == 4
                            ? CustomizedTheme.primaryBold
                            : CustomizedTheme.white,
                        minimumSize: Size(50.w, 50.h),
                        side: BorderSide(
                            width: 1.0.w, color: CustomizedTheme.primaryBold),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      onPressed: () {
                        setState(() {
                          selection = 4;
                          numberController.text = selection.toString();
                        });
                      },
                      child: Text("4",
                          style: selection != 4
                              ? CustomizedTheme.sf_b_W500_19
                              : CustomizedTheme.sf_w_W500_19)),
                  const SizedBox(width: 15),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selection == 5
                            ? CustomizedTheme.primaryBold
                            : CustomizedTheme.white,
                        minimumSize: Size(50.w, 50.h),
                        side: BorderSide(
                            width: 1.0.w, color: CustomizedTheme.primaryBold),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      onPressed: () {
                        setState(() {
                          selection = 5;
                          numberController.text = selection.toString();
                        });
                      },
                      child: Text("5",
                          style: selection != 5
                              ? CustomizedTheme.sf_b_W500_19
                              : CustomizedTheme.sf_w_W500_19)),
                ],
              ),

              // selection != 0 ?  ListView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: selection,
              //   itemBuilder: (context, index) {
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.symmetric(vertical: 20.h),
              //           child: Text('Traveller ${index +1}',style: CustomizedTheme.sf_b_W500_19,),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "First Name",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "Last Name",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "Phone Number",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "Email",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "Nationality",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 20.h),
              //           child: TextFormField(
              //             showCursor: true,
              //             decoration: InputDecoration(
              //               contentPadding: EdgeInsets.only(left: 30.45,right: 44.45,top: 23.66,bottom: 23.66),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                   borderSide: BorderSide(color: CustomizedTheme.colorAccent,width: .01)),
              //               labelText: "Emirates ID/Passport Number",
              //               labelStyle: TextStyle(color: CustomizedTheme.colorAccent),
              //               enabledBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //               focusedBorder: const OutlineInputBorder(
              //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //                 borderSide: BorderSide(color: Colors.lightBlue,width: 1),
              //               ),
              //             ),
              //             // controller: personController,
              //             autovalidateMode: AutovalidateMode.onUserInteraction,
              //             // Return null if the entered email is valid
              //             validator: (value) {
              //               if (value!.trim().isEmpty) {
              //                 return 'Please enter a number';
              //               }
              //               if (value.trim().length > 9) {
              //                 return 'You can pay up for 9 people';
              //               }
              //               return null;
              //             },
              //           ),
              //         ),
              //
              //       ],
              //     );
              //   },
              // ): SizedBox(),

              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 57.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // width: 154.94,
                        height: 56.8.h,
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
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/DetailsTravelersPage',
                                  arguments: DetailsTravelersArg(
                                    travelerCount:
                                        int.parse(numberController.text),
                                    type: widget.type,
                                    locationId: widget.locationId,
                                  ));
                            },
                            child: Text("Next",
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
}
