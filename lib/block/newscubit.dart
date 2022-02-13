import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/block/newsstates.dart';
import 'package:newsapp/layout/business.dart';
import 'package:newsapp/layout/science.dart';
import 'package:newsapp/layout/sports.dart';
import 'package:newsapp/network/remote.dart';

class Newscubit extends Cubit<Newsstates> {
  Newscubit() : super(newinitialstate());
  static Newscubit get(context) => BlocProvider.of(context);
  var indexcounter = 0;
  List<Widget> screens = const [
    businesslayout(),
    sportslayout(),
    sciencelayout(),
  ];

  List<BottomNavigationBarItem> navigationitem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'sporsts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
  ];
  List<String> titles = [
    'business news',
    'sports news ',
    'science news',
    'setting news',
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void changebottomnavbar(int index) {
    indexcounter = index;
    emit(changenavigatoinstates());
  }

  bool isdark = false;
  void changemodethem() {
    if (isdark == false) {
      isdark = false;
      ThemeMode.light;
    } else {
      isdark = true;
      ThemeMode.dark;
    }
    emit(changedarkmode());
  }

  void getbusiness() {
    emit(getbusinesscirclestates());
    Diohelper.getdate(url: 'v2/top-headlines', quary: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '4ce82e424b3d44bea574faab26c8e413',
    }).then((value) {
      log(value.toString());
      business = value.data['articles'];
      print(business.length);
      emit(getbusinessdatastates());
    }).catchError((Error) {
      print(Error.toString());
      emit(getbusinesserrorstates(Error));
    });
  }

  void getsports() {
    emit(getsportscirclestates());
    Diohelper.getdate(url: 'v2/top-headlines', quary: {
      "country": "eg",
      "category": "sports",
      "apiKey": "4ce82e424b3d44bea574faab26c8e413",
    }).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      print(sports.length);
      emit(getsportsdatastates());
    }).catchError((Error) {
      print(Error.toString());
      emit(getsportserrorstates(Error));
    });
  }

  void getscience() {
    emit(getsciencecirclestates());
    Diohelper.getdate(url: 'v2/top-headlines', quary: {
      "country": "eg",
      "category": "science",
      "apiKey": "4ce82e424b3d44bea574faab26c8e413",
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      print(sports.length);
      emit(getsiencedatastates());
    }).catchError((Error) {
      print(Error.toString());
      emit(getscienceerrorstates(Error));
    });
  }
}
