import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';
import 'package:material_two_news_app/widget/textfieled.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 302,
              height: 283,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'asset/svg/loading.svg',
                    width: 52,
                    height: 52,
                  ),
                  sizedBox(0, 10),
                  Text('Please Wait ...'),
                  sizedBox(0, 20),
                  Text('We will send code verification/\ntp your email')
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, loginRoute);
                  },
                  child: Text(
                    'Back to Login',
                  ))
            ],
          );
        },
      );
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SvgPicture.asset('asset/svg/ilustrasi_password.svg')),
              sizedBox(0, 40),
              Center(
                  child: Text(
                'Forget Password',
                style: mainTitle,
              )),
              Center(
                  child: Text(
                'Please fill the input below here ',
                style: submainTitle,
              )),
              sizedBox(0, 40),
              textfiled(
                  controller: emailController,
                  hintText: 'Input your email',
                  label: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  obsText: false),
              sizedBox(0, 60),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                      color: Color(0xff1F8AC7),
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: IconButton(
                          onPressed: passwordReset,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 36,
                            color: Colors.white,
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
