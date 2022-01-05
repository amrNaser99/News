import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/layouts/news_layout.dart';
import 'package:new_app/shared/bloc_observer.dart';
import 'package:new_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:new_app/shared/cubit/app_cubit/app_states.dart';
import 'package:new_app/shared/cubit/news_cubit/news_cubit.dart';
import 'package:new_app/shared/network/local/cache_helper.dart';
import 'package:new_app/shared/network/remote/dio_helper.dart';
import 'package:new_app/shared/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  // late bool? isDark = false ;
  // isDark = CacheHelper.getBoolean(key: 'isDark');


  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final bool isDark;
  //
  // MyApp(this.isDark) ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeThemeMode()
          //   ..changeThemeMode(
          //   fromShared: isDark,
          // ),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness()..getSports()..getScience(),
        ),
      ],
      child: BlocConsumer<AppCubit, appStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News Paper',
            theme: lighTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            //cubit.isDark ? ThemeMode.dark : ThemeMode.light ,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}