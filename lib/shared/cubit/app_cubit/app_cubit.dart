import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/network/local/cache_helper.dart';

import 'app_states.dart';

class AppCubit extends Cubit<appStates> {
  AppCubit() : super(appInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false ;

  void changeThemeMode({bool? fromShared})
  {
    isDark = !isDark;
    emit(appChangeAppmodeState());

    // CacheHelper.butBoolean(key: 'isDark', value: isDark).then((value) {
    //
    // });
  }

}

