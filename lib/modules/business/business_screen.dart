import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/news_cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit/news_states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(

      listener: (context, state) {
      },
      builder: (context, state) {
        var list= NewsCubit.get(context).business;

        return articlesBuilder(list,context);
      },
    );
  }
}
