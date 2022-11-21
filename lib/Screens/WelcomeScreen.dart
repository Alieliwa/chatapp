import 'package:chatapp/Screens/LogInScreen.dart';
import 'package:chatapp/Screens/SignInScreen.dart';
import 'package:chatapp/shared/Constans/constans.dart';
import 'package:chatapp/shared/compoenets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Image.asset('assets/images/chat.png',height: 150.h,width: 150.w,),
                SizedBox(height: 20.h,),
                Text(
                  "Chatting App",
                  style: TextStyle(
                    fontSize: 30.0.sp,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Pacifico',
                    color: Colors.blueAccent.shade700,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0.w, left: 20.w),
                  child: defultMaterialButton(
                    backColor: Colors.blue.shade600,
                    text: 'Sign Up',
                    height: 50.h,
                    function: () {
                      NavigateTo(context: context, router: SignUpScreen());
                    },
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0.w, left: 20.w),
                  child: defultMaterialButton(
                    backColor: Colors.blue.shade900,
                    text: 'Log in',
                    height: 50.h,
                    function: () {
                      NavigateTo(context: context, router: LogInScreen());
                    },
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
