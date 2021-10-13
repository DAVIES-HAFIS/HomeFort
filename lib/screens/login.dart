
import 'package:flutter/material.dart';
import 'package:homefort_app/screens/gallery_page.dart';
import 'package:homefort_app/screens/reset_password.dart';
import 'package:homefort_app/screens/signup.dart';
import 'package:homefort_app/utility/colors.dart';
import 'package:homefort_app/utility/helper_function.dart';
import 'package:homefort_app/utility/route.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validate(BuildContext context) {
    if (_formKey.currentState.validate()) {
      successAlert(
        context,
        "Login Successful",
        "Welcome to HomeFort!",
            () async {
          final SharedPreferences _prefs = await SharedPreferences.getInstance();
          _prefs.setString('email', _email.text);
          Navigator.pushNamed(
              context, RoutesUrl.galleryscreen);
        },
      );
    } else {
      errorAlert(context, "OOPS",
          "Enter Login Credentials, your email address and password is required!");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => dismissKeyBoard(context),
          child: Container(
            color: AppColors.appBackColor,
            width: getScreenWidth(context)*1,
            height: getScreenHeight(context)*1,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getScreenWidth(context),
                    height: getScreenHeight(context) / 4,
                    decoration: BoxDecoration(
                      color: AppColors.LighterGreen,
                      image: DecorationImage(
                          image: AssetImage('assets/images/friends.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.05736),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.04464,
                        ),
                        Text(
                          'Welcome Back...',
                          style: TextStyle(
                            color: Color(0xff181725),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.008928,
                        ),
                        Text(
                          'Kindly input your details to login into your \ndashboard.',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.7),
                            fontSize: 15,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.04464,
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.008928,
                        ),
                        EmailTF(emailTEC: _email, obscure: false),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.02678,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        addVerticalSpacing(getScreenHeight(context) * 0.008928),
                        PasswordTextField(
                          passwordTEC: _password,
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.017857,
                        ),
                        GestureDetector(
                          child: ForgotPassword(
                            textColor: AppColors.lightGreen,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreatePassword()));
                          },
                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.0625,
                        ),
                        GestureDetector(
                          child: AppButton(
                            buttonColor: AppColors.lightDeepGreen,
                            buttonContent: 'Login',
                            contentColor: AppColors.greyWhite,
                          ),
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              successAlert(
                                context,
                                "Login Successful",
                                "Welcome to Contest Friday!",
                                    () async {
                                  final SharedPreferences _prefs = await SharedPreferences.getInstance();
                                  _prefs.setString('email', _email.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryPage()));
                                },
                              );
                            } else {
                              errorAlert(context, "OOPS",
                                  "Enter Login Credentials, your phone number and password is required!");
                            }
                          },
                          // validate(context),

                        ),
                        addVerticalSpacing(
                          getScreenHeight(context) * 0.017857,
                        ),
                        GestureDetector(
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don’t have an account yet?',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' Sign up',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.lightGreen),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Registeration()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
