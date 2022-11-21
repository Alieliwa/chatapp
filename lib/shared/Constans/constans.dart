
import 'package:chatapp/shared/Network/local/cacheHelper.dart';
import 'package:chatapp/shared/Styles/theme/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



dynamic onBoarding =CacheHelper.getDate(key: 'onBoarding');
dynamic testtoken = CacheHelper.getDate(key:'token');
String? token = '';

// UserDateModel userDateModel;
void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
Future NavigateAndFinsh ({required BuildContext context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);
//using for boarding screen after login or signup
void Onsubmit({context,router}){
  CacheHelper.saveDate(key:'onBoarding', value: true).then((value) =>
      NavigateAndFinsh(router:router,context: context)
  );
}

void LogOut({context,router}){
  print(testtoken);
  print(token);
  CacheHelper.sharedPreferences!.remove('token').then((value) {
    if(value ){
      NavigateAndFinsh(context: context,router: router);
    }

  });
}


void printFullText(String text){

final pattern = RegExp('.{1,800}');

    pattern.allMatches (text). forEach((match) => print(match.group(0)));

}


void Colorbackground(Colors RightColor,context)
{

  if(ThemeAppCubit.get(context).IsDark ) {
    RightColor= HexColor('333739') as Colors;
  }
  else{
    RightColor= Colors.white as Colors;
  }

}
