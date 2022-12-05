import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_two_news_app/utils/routes.dart';
import 'package:material_two_news_app/utils/theme.dart';
import 'package:material_two_news_app/widget/button.dart';
import 'package:material_two_news_app/widget/sizedbox.dart';
import 'package:material_two_news_app/widget/textfieled.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obsText = true;
  //  buat contollrer terlebih dahulu
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
  }

  bool passwordConfirmed() {
    if (confirmPasswordController.text.trim() ==
        passwordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    //  for register user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {
                Fluttertoast.showToast(msg: 'Success Register'),
                Navigator.pushReplacementNamed(context, homePageRoute)
              });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange.shade500,
          content: Text('Your password is wrong')));
    }

    //  for add detail user
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 36,
                  )),
              sizedBox(0, 20),
              Text(
                'Create Account',
                style: mainTitle,
              ),
              Text(
                'Please fill the input bellow here',
                style: submainTitle,
              ),
              sizedBox(0, 34),
              textfiled(
                controller: usernameController,
                hintText: 'Input your username',
                label: 'Username',
                icon: Icons.person_outline,
                keyboardType: TextInputType.name,
                obsText: false,
              ),
              sizedBox(0, 20),
              textfiled(
                controller: emailController,
                hintText: 'Input yor email',
                label: 'Emai',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                obsText: false,
              ),
              sizedBox(0, 20),
              textfiled(
                  controller: passwordController,
                  hintText: 'Input your password',
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
              sizedBox(0, 20),
              textfiled(
                  controller: confirmPasswordController,
                  hintText: 'Confirm yor password',
                  label: 'Confirm Password',
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
              sizedBox(0, 45),
              GestureDetector(
                  onTap: signUp,
                  child: button(context: context, title: 'REGISTER')),
              sizedBox(0, 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style:
                          addtionalText.copyWith(fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, loginRoute);
                      },
                      child: Text('Login',
                          style: addtionalText.copyWith(
                            color: Color(0xff1F8AC7),
                          )),
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
}
