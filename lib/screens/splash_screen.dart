

import 'package:flutter/material.dart';
import 'package:homefort_app/screens/login.dart';
import 'package:homefort_app/utility/colors.dart';
import 'package:homefort_app/utility/helper_function.dart';
import 'package:homefort_app/utility/route.dart';


String finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


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
                          color: Colors.black, fontWeight: FontWeight.w700,fontSize: 12),),
                    Padding(
                      padding: EdgeInsets.all(50),
                      child: GestureDetector(
                        child: AppButton(
                          buttonColor: AppColors.lightDeepGreen,
                          buttonContent: 'Get Started',
                          contentColor: AppColors.greyWhite,
                        ),
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                        // validate(context),

                      ),
                    ),
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
