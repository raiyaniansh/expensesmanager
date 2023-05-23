import 'package:expensesmanager/screen/accountmore/accountm_screen.dart';
import 'package:expensesmanager/screen/accountmoreb/view/accountmb_screen.dart';
import 'package:expensesmanager/screen/add/view/add_screen.dart';
import 'package:expensesmanager/screen/bottom/view/bottom_screen.dart';
import 'package:expensesmanager/screen/ex/view/ex_screen.dart';
import 'package:expensesmanager/screen/filter/view/filter_screen.dart';
import 'package:expensesmanager/screen/home/view/home_screen.dart';
import 'package:expensesmanager/screen/inex/view/inex_screen.dart';
import 'package:expensesmanager/screen/splash/view/splash_screen.dart';
import 'package:expensesmanager/screen/update/view/update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => SplashScreen(),transition: Transition.fadeIn),
          GetPage(name: '/bottom', page: () => BottomScreen(),transition: Transition.fadeIn),
          GetPage(name: '/home', page: () => HomeScreen(),transition: Transition.fadeIn),
          GetPage(name: '/add', page: () => AddScreen(),transition: Transition.fadeIn),
          GetPage(name: '/accm', page: () => AccountMScreen(),transition: Transition.fadeIn),
          GetPage(name: '/accb', page: () => AccountMBScreen(),transition: Transition.fadeIn),
          GetPage(name: '/inex', page: () => Inex_screen(),transition: Transition.fadeIn),
          GetPage(name: '/exs', page: () => ExScreen(),transition: Transition.fadeIn),
          GetPage(name: '/fil', page: () => FilterScreen(),transition: Transition.fadeIn),
          GetPage(name: '/update', page: () => UpdateScreen(),transition: Transition.fadeIn),
        ],
      ),
    )
  );
}