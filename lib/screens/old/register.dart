// import 'package:borderpay/app_theme/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';
//
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   bool _obscureText = true;
//   var registerCAT = 'visitor';
//   // Toggles the password show status
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         // leadingWidth: 33.73,
//         leading: Center(
//           child: GestureDetector(
//             onTap: (){Navigator.pop(context);},
//             child: Container(
//               height: 33.73,
//               width: 33.73,
//               // margin: EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(9.16),
//                     color: CustomizedTheme.colorAccent),
//                 child: Icon(Icons.arrow_back,color: CustomizedTheme.white)),
//           ),
//         ),
//         title: Text("Register", style: CustomizedTheme.title_p_W500_21),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.36),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 55.46,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.black,width: 1.0)),
//                   labelText: "Name",
//                   labelStyle: CustomizedTheme.b_W400_12,
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 // controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value!.trim().isEmpty) {
//                     return 'Please enter name';
//                   }
//                   // Check if the entered email has the right format
//                   // if (value.trim().length < 6) {
//                   //   return 'Enter correct password';
//                   // }
//                   // Return null if the entered email is valid
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 35.53,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.name,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.black,width: 1.0)),
//                   labelText: "Nationality",
//                   labelStyle: CustomizedTheme.b_W400_12,
//                   isDense: true,
//                   suffixIcon: CountryCodePicker(
//                     enabled: false,
//                     flagWidth: 36,
//                     barrierColor: CustomizedTheme.primaryColor,
//                     // show/hide country code for phone
//                     hideMainText: true,
//                     onChanged: print,
//                     // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                     initialSelection: 'AE',
//                     // favorite: ['+39','FR'],
//                     // optional. Shows only country name and flag
//                     showCountryOnly: true,
//                     // optional. Shows only country name and flag when popup is closed.
//                     showOnlyCountryWhenClosed: false,
//                     // optional. aligns the flag and the Text left
//                     alignLeft: false,
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 // controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value!.trim().isEmpty) {
//                     return 'Please enter password';
//                   }
//                   // Check if the entered email has the right format
//                   if (value.trim().length < 6) {
//                     return 'Enter correct password';
//                   }
//                   // Return null if the entered email is valid
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 35.53,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.black,width: 1.0)),
//                   labelText: "Phone Number",
//                   labelStyle: CustomizedTheme.b_W400_12,
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 // controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value!.trim().isEmpty) {
//                     return 'Please enter password';
//                   }
//                   // Check if the entered email has the right format
//                   if (value.trim().length < 6) {
//                     return 'Enter correct password';
//                   }
//                   // Return null if the entered email is valid
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 35.53,
//               ),
//               TextFormField(
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
//                   suffixIcon: IconButton(
//                     icon: Image.asset('assets/icons/obscure.png',
//                       color:_obscureText ? Colors.black :Colors.black.withOpacity(.3),
//                     ),
//                     onPressed: () {
//                       _toggle();
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.black,width: 1.0)),
//                   labelText: "Password",
//                   labelStyle: CustomizedTheme.b_W400_12,
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 // controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value!.trim().isEmpty) {
//                     return 'Please enter password';
//                   }
//                   // Check if the entered email has the right format
//                   if (value.trim().length < 6) {
//                     return 'Enter correct password';
//                   }
//                   // Return null if the entered email is valid
//                   return null;
//                 },
//               ),
//
//               //Registration Category
//               Padding(
//                 padding: const EdgeInsets.only(top: 31.17,bottom: 14),
//                 child: Text("Please Select your Category", style: CustomizedTheme.sf_b_W400_17),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 61.07,
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//                           side: BorderSide(width: 1.0, color: registerCAT == 'resident' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             registerCAT = 'resident';
//                             print(registerCAT);
//                           });
//                         },
//                         child: Text('Resident',style: TextStyle(color: registerCAT == 'resident' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack)),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 15),
//                   Expanded(
//                     child: SizedBox(
//                       height: 61.07,
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//                           side: BorderSide(width: 1.0, color: registerCAT == 'visitor' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             registerCAT = 'visitor';
//                             print(registerCAT);
//                           });
//                         },
//                         child: Text('Visitor',style: TextStyle(color: registerCAT == 'visitor' ? CustomizedTheme.colorAccent:CustomizedTheme.colorAccentBlack)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 36),
//               //RESIDENT ID
//               registerCAT == 'resident' ? TextFormField(
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.black,width: 1.0)),
//                   labelText: "Emirates ID",
//                   labelStyle: CustomizedTheme.b_W400_12,
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//                 // controller: passwordController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   if (value!.trim().isEmpty) {
//                     return 'Please enter password';
//                   }
//                   // Check if the entered email has the right format
//                   if (value.trim().length < 6) {
//                     return 'Enter correct password';
//                   }
//                   // Return null if the entered email is valid
//                   return null;
//                 },
//               ):Container(),
//               SizedBox(height: 36.23),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 61.07,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                           color: CustomizedTheme.colorAccent
//                       ),
//                       child: TextButton(onPressed: () {Navigator.pushNamed(context, '/otp');},
//                           child: Text("Register",style: CustomizedTheme.w_W500_19)),
//                     ),
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 26.08),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height:1,width: MediaQuery.of(context).size.width,
//                       color: CustomizedTheme.primaryLine,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal:12.6),
//                     child: Text("OR",style: CustomizedTheme.roboto_l_W400_14),
//                   ),
//                   Expanded(
//                     child: Container(
//                       height:1,width: MediaQuery.of(context).size.width,
//                       color: CustomizedTheme.primaryLine,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 24.75),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 61.07,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: CustomizedTheme.colorAccent,width: .5),
//                           borderRadius: BorderRadius.circular(7),
//                       ),
//                       child: TextButton(onPressed: () {  },
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset('assets/icons/ic_google.png'),
//                               SizedBox(width: 16.25,),
//                               Text("Continue with Google",style: CustomizedTheme.b_W400_16),
//                             ],
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 18.58,),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 61.07,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: CustomizedTheme.colorAccent,width: .5),
//                         borderRadius: BorderRadius.circular(7),
//                       ),
//                       child: TextButton(onPressed: () {  },
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset('assets/icons/ic_facebook.png'),
//                               SizedBox(width: 16.25,),
//                               Text("Continue with Facebook",style: CustomizedTheme.b_W400_16),
//                             ],
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
