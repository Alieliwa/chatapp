// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'SIGN IN',
//             style: TextStyle(
//               fontSize: 20.sp,
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
import 'package:chatapp/Screens/chatScreen.dart';
import 'package:chatapp/shared/Constans/constans.dart';
import 'package:chatapp/shared/Styles/colors.dart';
import 'package:chatapp/shared/compoenets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formkey = GlobalKey<FormState>();

  bool _secirty = true;

  var emailController = TextEditingController();
  var passController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool _saving = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defultColor,
        title: Center(
          child: Text(
            'SIGN UP',
            style: TextStyle(fontSize: 20.sp, fontFamily: 'Pacifico'),
          ),
        ),
      ),
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(color: defultColor,),
        inAsyncCall: _saving,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.black54,
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.h,
                          ),
                          child: defulutTextFormFild(
                            style: Theme.of(context).textTheme.bodyText2,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            labeltext: 'Enter Your email',
                            hintText: 'Enter Your email',
                            obscureText: !_secirty,
                            prefix: Icon(
                              Icons.phone,
                              color: defultColor,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your email';
                              }
                              return null;
                            },
                            // onSubmited: (){},
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.h,
                          ),
                          child: defulutTextFormFild(
                              style: Theme.of(context).textTheme.bodyText2,
                              controller: passController,
                              type: TextInputType.text,
                              labeltext: 'Enter Your Password',
                              hintText: 'Enter Your Password',
                              obscureText: _secirty,
                              prefix: Icon(
                                Icons.lock,
                                color: defultColor,
                              ),
                              // suffix: LoginCubit.get(context).suffix,
                              // suffixFun: () {
                              //   LoginCubit.get(context)
                              //       .ChangePasswordVisibility();
                              // },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Password';
                                }
                                if (value.length <= 5) {
                                  return 'الرجاء إدخال كلمة مرور صحيحه';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0.w, left: 20.0.w),
                          child: defultMaterialButton(
                            height: 40.h,
                            width: double.infinity,
                            text: 'Sign Up',
                            function: () async {
                              if (formkey.currentState!.validate()) {
                                // print(emailController.text);
                                // print(passController.text);
                                setState(() {
                                  _saving = true;
                                });

                                try {
                                  final newUser =
                                      await _auth.createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passController.text);
                                  NavigateAndFinsh(
                                      router: ChatScreen(), context: context);
                                  setState(() {
                                    _saving = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You have account ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF8D8E98),
                                )),
                            defultTextButton(
                              text: 'Log In Now ....',
                              onPressed: () {
                                NavigateTo(
                                    router: SignUpScreen(), context: context);
                              },
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
