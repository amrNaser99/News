import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/search.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:new_app/shared/cubit/news_cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  NavigateTo(context, SearchScreen(),);
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomItems(index);
            },
          ),
        );
      },
    );
  }
}
