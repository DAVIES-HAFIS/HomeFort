
import 'package:flutter/material.dart';
import 'package:homefort_app/utility/colors.dart';
import 'package:homefort_app/utility/helper_function.dart';
import 'package:homefort_app/utility/route.dart';



class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic validate() {
    if (_formKey.currentState.validate()) {
      successAlert(
          context,
          "Password Set Successfully",
          " Kindly log-in to proceed!",
              () => Navigator.pushNamed(context, RoutesUrl.loginscreen));
    } else {
      errorAlert(context, "OOPS",
          "Credentials inputted are invalid!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: GestureDetector(
        onTap: () => dismissKeyBoard(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.appBackColor,
              width: getScreenWidth(context)*1,
              height: getScreenHeight(context)*1,
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getScreenWidth(context) * 0.05736),
                  width: getScreenWidth(context) * 1,
                  height: getScreenHeight(context) * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpacing(getScreenHeight(context) * 0.0717,),
                      GestureDetector(
                        child: produceBackImage(),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0315,),
                      Text(
                        'Create new password',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.01785,),
                      Text(
                        'Kindly enter your new password to get your \n account secured.',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0625,),
                      Text(
                        'Enter new Password',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0089,),
                      PasswordTextField(
                        passwordTEC: _password,
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0267,),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.0089,),
                      ConfirmPasswordFormField(
                        confirmPassword: _confirmPassword,
                        password: _password,
                      ),
                      addVerticalSpacing(getScreenHeight(context) * 0.219,),
                      GestureDetector(
                        child: AppButton(
                          buttonColor: AppColors.lightDeepGreen,
                          buttonContent: 'Create Password',
                          contentColor: Colors.white,
                          contentSize: 17,
                        ),
                        onTap: validate,
                      ),
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
