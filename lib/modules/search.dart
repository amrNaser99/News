import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/news_cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var search = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                defaultTextFormField(
                  context: context,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  labelText: 'Search',
                  prefixIcon: Icons.search,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field must be not Empty';
                    } else {
                      return null;
                    }
                  },
                  onSubmitted: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  labelStyle: Theme.of(context).textTheme.bodyText2
                ),
                if(state is NewsSearchSuccessState)
                  Text('Result of ${searchController.text} is:',
                  ),
                Expanded(
                  child: articlesBuilder(
                    search,
                    context,
                    isSearch: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
