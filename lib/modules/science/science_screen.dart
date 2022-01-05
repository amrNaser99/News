import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/news_cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_cubit/news_states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(

      listener: (context, state) {
      },
      builder: (context, state) {
        var list= NewsCubit.get(context).science;

        return articlesBuilder(list,context);
      },
    );

  }
}