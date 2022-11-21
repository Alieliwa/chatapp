import 'package:bloc/bloc.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:chatapp/shared/Network/local/cacheHelper.dart';
import 'package:chatapp/shared/Styles/theme/cubit/states.dart';


class ThemeAppCubit extends Cubit<ThemeAppStates>
{
  ThemeAppCubit() : super(InitialThemeAppState());
  static  ThemeAppCubit get(context) => BlocProvider.of(context);

  bool IsDark=false;
  void ChangeAppMode({bool? fromShared}){
    if(fromShared != null) {
      IsDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      IsDark = !IsDark;
      CacheHelper.putDate(key: 'IsDark', value: IsDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




}
