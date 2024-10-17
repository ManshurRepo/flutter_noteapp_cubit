// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:flutter_sqlite_todo/shared/styles/themes.dart';
import 'package:flutter_sqlite_todo/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
bool isDark = sharedPreferences.getBool("isDark") ?? false;

  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      child:  MyApp(isdark: isDark,)));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isdark,
  });
final bool isdark;
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()..createDatabase()..changeTheMode(darkMode: isdark)),
      ],
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (BuildContext context, state) {
          var cubit = TodoCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark? ThemeMode.dark : ThemeMode.light,
            home: AnimatedSplashScreen(
              splash: Image.asset('assets/images/icon.png'),
              nextScreen: const HomeScreen(),
              backgroundColor: Colors.blue.shade50,
              splashTransition: SplashTransition.rotationTransition,
            ),
          );
        },
      ),
    );
  }
}
