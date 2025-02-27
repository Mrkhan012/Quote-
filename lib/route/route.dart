import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:quote/route/route_names.dart';
import 'package:quote/view/home_view.dart';
import 'package:quote/view/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashScreen(),
          transition: Transition.noTransition,
        ), 
         GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transition: Transition.noTransition,
        ),
        
          ];}