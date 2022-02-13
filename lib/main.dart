import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/block/newscubit.dart';
import 'package:newsapp/block/newsstates.dart';
import 'package:newsapp/layout/layout.dart';
import 'package:newsapp/network/remote.dart';  
import 'block/blockstatus.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  Diohelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Newscubit(),
      child: BlocConsumer<Newscubit, Newsstates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  appBarTheme: const AppBarTheme(
                    titleSpacing: 20.0,
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    shadowColor: Colors.white,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarBrightness: Brightness.dark,
                    ),
                    titleTextStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20.0,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey,
                  ),
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('333739'),
                  primarySwatch: Colors.deepOrange,
                  appBarTheme: AppBarTheme(
                    elevation: 0.0,
                    titleSpacing: 20.0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    backwardsCompatibility: false,
                    backgroundColor: HexColor('333739'),
                    shadowColor: Colors.white,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarBrightness: Brightness.light,
                    ),
                    titleTextStyle: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 12.0,
                    backgroundColor: HexColor('333739'),
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.grey,
                  ),
                  textTheme: const TextTheme(
                      bodyText1: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                themeMode: Newscubit.get(context).isdark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const Newslayout());
          }),
    );
  }
}
