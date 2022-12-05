import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_two_news_app/data/news.dart';
import 'package:material_two_news_app/page/Auth/forget_password.dart';
import 'package:material_two_news_app/page/account_screen.dart';
import 'package:material_two_news_app/page/Auth/login_page.dart';
import 'package:material_two_news_app/page/Auth/main_page.dart';
import 'package:material_two_news_app/page/Auth/register.dart';
import 'package:material_two_news_app/page/detail_page.dart';
import 'package:material_two_news_app/page/home_screen.dart';
import 'package:material_two_news_app/page/splashscreen.dart';
import 'package:material_two_news_app/page/webview_page.dart';
import 'package:material_two_news_app/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreenRoute,
      routes: {
        splashScreenRoute: (context) => SplashScreen(),
        mainPageRoute: (context) => MainPage(),
        loginRoute: (context) => LoginPage(),
        registerRoute: (context) => RegisterPage(),
        accountRoute: (context) => AccountScreen(),
        forgetPasswordRoute: (context) => ForgetPassword(),
        homePageRoute : (context) => HomeScreen() ,
        detailPage :(context) => DetailPage(ModalRoute.of(context)?.settings.arguments as Article) ,
        webViewRoute : (context) => Webviewpage(ModalRoute.of(context)?.settings.arguments as String ) ,
      },
    );
  }
}
