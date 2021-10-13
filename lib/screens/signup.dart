

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homefort_app/utility/colors.dart';
import 'package:homefort_app/utility/helper_function.dart';
import 'package:homefort_app/utility/route.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validate(BuildContext context) {
    if (_formKey.currentState.validate()) {
      successAlert(
        context,
        "Registeration Successful",
        "Login to your dashboard to proceed!",
            () {
          Navigator.pushNamed(
              context, RoutesUrl.loginscreen);
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
      backgroundColor: AppColors.White,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => dismissKeyBoard(context),
          child: SafeArea(
            child: Container(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.05),
                  width: getScreenWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      GestureDetector(
                        child: produceBackImage(),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.03,),
                      Text(
                        "Let's Get Started",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.01785,),
                      Text(
                        'Create an account today to be a part of our \n community',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: getScreenWidth(context) * 0.422,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('First Name'),
                                    addVerticalSpacing(getScreenHeight(context) * 0.00892),
                                    NameTF(
                                      nameTEC: _firstname,
                                      obscure: false,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: getScreenWidth(context) * 0.422,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text('Last Name'),
                                    addVerticalSpacing(getScreenHeight(context) * 0.00892),
                                    NameTF(
                                        nameTEC: _lastname, obscure: false),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0089,),
                      EmailTF(emailTEC: _email, obscure: false),
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                      PhoneTextField(phoneNumberTEC: _phone, obscure: false),
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                      PasswordTextField(
                        passwordTEC: _password,
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.02,),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.008928,),
                      ConfirmPasswordFormField(
                        confirmPassword: _confirmPassword,
                        password: _password,
                      ),
                      addVerticalSpacing(20),
                      GestureDetector(
                        child: AppButton(
                          buttonColor: AppColors.lightDeepGreen,
                          buttonContent: 'Create Account',
                          contentColor: AppColors.greyWhite,
                        ),
                        onTap: () => validate(context),
                      ),
                      addVerticalSpacing(30),
                      GestureDetector(
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already a member?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: ' Login',
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
                          Navigator.pushNamed(
                              context, RoutesUrl.loginscreen);
                        },
                      ),
                      addVerticalSpacing(100)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
