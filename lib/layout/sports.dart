import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/block/newscubit.dart';
import 'package:newsapp/block/newsstates.dart';
import 'package:newsapp/reusable%20component/reusable.dart';

class sportslayout extends StatelessWidget {
  const sportslayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, Newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = Newscubit.get(context).sports;
          return articlebuilder(list, context);
        });
  }
}
