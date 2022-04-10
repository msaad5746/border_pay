import 'dart:async';

import 'package:borderpay/Utils/utils.dart';
import 'package:borderpay/l10n/l10n.dart';
import 'package:borderpay/model/arguments/register_datatoserver.dart';
import 'package:borderpay/model/arguments/register_first.dart';
import 'package:borderpay/model/arguments/register_two.dart';
import 'package:borderpay/screens/host.dart';
import 'package:borderpay/screens/login.dart';
import 'package:borderpay/screens/otp.dart';
import 'package:borderpay/screens/phone.dart';
import 'package:borderpay/screens/register_page.dart';
import 'package:borderpay/screens/resident.dart';
import 'package:borderpay/screens/scan_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/welcome_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return _connectionStatus == ConnectivityResult.mobile || _connectionStatus == ConnectivityResult.wifi ? ScreenUtilInit(
      builder: () => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,

        debugShowCheckedModeBanner: false,
        navigatorKey: Utils.mainKey,
        // builder: (context,widget)=>ResponsiveWrapper.builder(
        //     BouncingScrollWrapper.builder(context, widget!),
        //     maxWidth: 1200,
        //     minWidth: 480,
        //     defaultScale: true,
        //     breakpoints: [
        //       ResponsiveBreakpoint.resize(480, name: MOBILE),
        //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
        //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        //       ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        //     ],
        //     background: Container(color: Color(0xFFF5F5F5))),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const ,
        onGenerateRoute: (settings) {
          Widget page = WelcomePage();
          switch(settings.name){
            case '/':
              page = WelcomePage();
              break;
            case '/ResidentPage':
              page = ResidentPage();
              break;
            case '/RegisterPage':
              page = RegisterPage();
              break;
            case '/ScanIDPage':
              RegisterFirst data = settings.arguments as RegisterFirst;
              page = ScanIDPage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                email: data.email,
                nationality: data.nationality,
                nationalityId: data.nationalityId,
              );
              break;
            case '/PhonePage':
              RegisterTwo data = settings.arguments as RegisterTwo;
              page = PhonePage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                email: data.email,
                nationality: data.nationality,
                nationalityId: data.nationalityId,
                eid: data.eid,
                image: data.image,
              );
              break;
            case '/otp':
              RegisterDataServer data= settings.arguments as RegisterDataServer;
              page = OTPPage(
                firstName: data.firstName,
                lastName: data.lastName,
                areaCode: data.areaCode,
                phone: data.phone,
                email: data.email,
                nationality: data.nationality,
                emiratedpassport: data.emiratedpassport,
                image: data.image,
              );
              break;
            case '/login':
              page = LoginPage();
              break;
            case '/hostpage':
              page = HostPage();
              break;

          }
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page
          );
        },
      ),
      designSize: const Size(375,812),
    ):const MaterialApp(
      home: Text('')
    );
  }
}
