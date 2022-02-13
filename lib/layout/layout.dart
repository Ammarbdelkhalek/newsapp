import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/block/newscubit.dart';
import 'package:newsapp/block/newsstates.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Newscubit()
        ..getbusiness()
        ..getsports()
        ..getscience(),
      child: BlocConsumer<Newscubit, Newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Newscubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.indexcounter]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    Newscubit.get(context).changemodethem();
                  },
                  icon: Icon(cubit.isdark ? Icons.dark_mode : Icons.light_mode),
                ),
              ],
            ),
            body: cubit.screens[cubit.indexcounter],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.navigationitem,
              currentIndex: cubit.indexcounter,
              onTap: (index) {
                cubit.changebottomnavbar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
