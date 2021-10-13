import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homefort_app/utility/colors.dart';
import 'package:homefort_app/utility/helper_function.dart';
import 'package:homefort_app/utility/navigate.dart';
import 'package:homefort_app/utility/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    getValidationData().whenComplete(()  {
      if(finalEmail == null){
        Timer(Duration(seconds: 10), ()=> navigateAndReplaceRoute(context,RoutesUrl.loginscreen));
      } else {
        Timer(Duration(seconds: 10), ()=> navigateAndReplaceRoute(context, RoutesUrl.galleryscreen));
      }
    });
    super.initState();
  }

  getValidationData() async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var obtainEmail = _prefs.getString('email');
    setState(() {
      finalEmail = obtainEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: getScreenWidth(context) * 1,
              height: getScreenHeight(context) * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/groceries.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: getScreenWidth(context) * 1,
              height: getScreenHeight(context) * 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(242, 144, 47, 0.05),
                    Color.fromRGBO(58, 149, 60, 0.4),
                    Color.fromRGBO(0, 0, 0, 0.7)
                  ],
                ),
              ),
            ),
            Container(
              width: getScreenWidth(context) * 1,
              height: getScreenHeight(context) * 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                     "WE CRAVE YOUR Satisfaction.......",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.lightDeepGreen,fontSize: 24,),
                    ),
                    Text('Come Onboard With HomeFort',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.greyWhite, fontWeight: FontWeight.w700,fontSize: 12),),
                    addVerticalSpacing(20),
                    addVerticalSpacing(100),
                    Text('HomeFort Energy, 2021 Copyright',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.lightGreen, fontWeight: FontWeight.w700,fontSize: 12),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
