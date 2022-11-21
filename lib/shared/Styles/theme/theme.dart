import 'package:chatapp/shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';


ThemeData darkthemes = ThemeData(
    primarySwatch: defultColor,
  primaryColor: defultColor,
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700,color: Colors.white,),
    bodyText2:  TextStyle(fontSize: 16.sp, color: Colors.white),
    headline1:TextStyle(fontSize: 30.sp, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),
  ),
  fontFamily: 'janna',

  scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      backgroundColor:HexColor('333739'),
      elevation: 0,
      titleTextStyle: TextStyle(
        color:Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        //fontStyle: FontStyle.italic
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness:Brightness.light,


      ),
    ),



  drawerTheme: DrawerThemeData(backgroundColor: HexColor('333739') ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defultColor,
      unselectedItemColor: Colors.white,
      backgroundColor:HexColor('333739'),
      elevation: 20,
    ),
);






ThemeData lightthemes = ThemeData(
  primaryColor: defultColor,
    primarySwatch: defultColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleSpacing: 20.h,
      iconTheme: IconThemeData(color: Colors.black),
//backwardsCompatibility: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color:Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness:Brightness.dark,
// statusBarBrightness: Brightness.dark,

      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defultColor,
      unselectedItemColor: Colors.white,
      backgroundColor: defultColor,
      elevation: 20,
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.white, ),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700,color: Colors.black),
      bodyText2:  TextStyle(fontSize: 16.sp, color: Colors.black),
      headline1:TextStyle(fontSize: 30.sp, color: Colors.black54, fontWeight: FontWeight.w600,),
      headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),

    ),
    fontFamily: 'janna',

);