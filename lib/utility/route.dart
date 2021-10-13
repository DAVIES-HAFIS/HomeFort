
import 'package:flutter/material.dart';
import 'package:homefort_app/screens/gallery_page.dart';
import 'package:homefort_app/screens/login.dart';
import 'package:homefort_app/screens/reset_password.dart';
import 'package:homefort_app/screens/signup.dart';
import 'package:homefort_app/screens/splash_screen.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesUrl.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesUrl.galleryscreen:
        return MaterialPageRoute(builder: (_) => GalleryPage());
      case RoutesUrl.loginscreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesUrl.createpassword:
        return MaterialPageRoute(builder: (_) => CreatePassword());
      case RoutesUrl.registeration:
        return MaterialPageRoute(builder: (_) => Registeration());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

//Routes
class RoutesUrl {
  RoutesUrl._();
  static const String splashScreen = "/";
  static const String galleryscreen = "/galleryscreen";
  static const String loginscreen = "/loginscreen";
  static const String createpassword = "/createpassword";
  static const String registeration = "/registeration";
}
