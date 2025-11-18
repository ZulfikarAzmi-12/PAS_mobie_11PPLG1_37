import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas/binding/drawer_binding.dart';
import 'package:pas/binding/home_binding.dart';
import 'package:pas/binding/login_binding.dart';
import 'package:pas/binding/register_binding.dart';
import 'package:pas/binding/splashscreen_binding.dart';
import 'package:pas/pages/favorit_page.dart';
import 'package:pas/pages/home_page.dart';
import 'package:pas/pages/login_page.dart';
import 'package:pas/pages/profile_page.dart';
import 'package:pas/pages/register_page.dart';
import 'package:pas/pages/splashscreen_page.dart';
import 'package:pas/routes/route.dart';
import 'package:pas/widget/drawer.dart';

class AppPage {
  static final page = [
    GetPage(
      name: AppRoutes.register, 
      page: () => RegisterPage(),
      binding: RegisterBinding()
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding()
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [
        HomeBinding(),
        DrawerBinding()
      ]
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.favorit,
      page: () => FavoritePage(),
      binding: HomeBinding()
    ),
    
  ];
}