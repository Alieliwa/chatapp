import 'package:chatapp/shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';



//MaterialButton

Widget defultMaterialButton({
  required double width,
  required double height,
  Color backColor = defultColor,
  double borderRadius = 25,
  double fontsize = 20,
  Color ColorText: Colors.white,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: backColor,
        hoverColor: Colors.black,
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontsize.sp,
            fontFamily: 'Pacifico',
            color: ColorText,
          ),
        ),
      ),
    );

//TextFormField

Widget defulutTextFormFild(
        {
          TextEditingController? controller,
         FormFieldValidator? validator,
         TextInputType? type,
         String? labeltext,
         String? hintText,
         IconData? suffix,
         Widget? prefix,
         bool? obscureText,
         bool? secirty,
         VoidCallback? suffixFun,
         ValueChanged<String>? onChanged,
         VoidCallback? onTap,
         // required Function onSubmited,
         TextStyle? style}) =>
    TextFormField(
      style: style,
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText!,
      onChanged: onChanged,
      // textAlign: TextAlign.end,
      // onFieldSubmitted: onSubmited(),
      onTap: onTap,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defultColor),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(),
        labelText: labeltext,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF8D8E98)),
        labelStyle: TextStyle(color: defultColor),
        prefixIcon: prefix,
        suffixIcon: IconButton(
            icon: Icon(suffix, color: defultColor), onPressed: suffixFun),
      ),
    );

//TextButton
Widget defultTextButton(
        {required String text, required VoidCallback onPressed,required Color color}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: color),
        ));

//toast بيعرض رساله تسجيل الدخل سواء البايانات صح او غلط
Future<bool>? showError(
        {required String massage,
        required ToastState state,
         int? timeInSecForIosWeb,
        ToastGravity gravity = ToastGravity.BOTTOM,
         Toast? toastLength}) {
  Fluttertoast.showToast(
    msg: massage,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0.sp);}

enum ToastState { SUCCESS, ERROR, WARNING }
Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.blue;
      break;
  }
  return color;
}

//خط فاصل
Widget MyDivider({double margin = 0.0,}) => Container(
      color: Color(0xFF8D8E98),
      width: double.infinity,
      height: 2.0.h,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: margin),
    );

const bgColor = Color(0xFF8D8E98);
