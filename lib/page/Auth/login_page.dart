import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/button.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';
import 'package:material_two_news_app/widget/textfieled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsText = true;
  //  buat contollrer terlebih dahulu
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {
                Fluttertoast.showToast(msg: 'Succes Login'),
                Navigator.pushReplacementNamed(context, homePageRoute)
              });
    } on FirebaseException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'asset/svg/ilustrasi_login.svg',
                  height: 200,
                ),
              ),
              sizedBox(0, 20),
              Text(
                'Login',
                style: mainTitle,
              ),
              Text(
                'Please Sign in to continue',
                style: submainTitle,
              ),
              sizedBox(0, 20),
              textfiled(
                controller: emailController,
                hintText: 'Input your email',
                label: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                obsText: false,
              ),
              sizedBox(0, 20),
              textfiled(
                  controller: passwordController,
                  hintText: 'Input yor password',
                  label: 'Password',
                  icon: Icons.lock_outlined,
                  keyboardType: TextInputType.visiblePassword,
                  obsText: _obsText,
                  iconSufix: IconButton(
                      onPressed: () {
                        _obsText = !_obsText;
                        setState(() {});
                      },
                      icon: Icon(
                        !_obsText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.blueGrey,
                      ))),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, forgetPasswordRoute);
                    },
                    child: Text(
                      'Forgot password',
                      style: addtionalText.copyWith(fontSize: 14),
                    )),
              ),
              sizedBox(0, 40),
              GestureDetector(
                  onTap: signIn,
                  child: button(context: context, title: 'LOGIN')),
              sizedBox(0, 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style:
                          addtionalText.copyWith(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, registerRoute);
                      },
                      child: Text(
                        'Register Now',
                        style: addtionalText.copyWith(color: Color(0xff1F8AC7)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange.shade500,
        content: Text(message.toString())));
  }
}
