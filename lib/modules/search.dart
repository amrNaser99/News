import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/shared/components/components.dart';
import 'package:new_app/shared/cubit/news_cubit/news_cubit.dart';
import 'package:new_app/shared/cubit/news_cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var searchController = TextEditingController();
        var search = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                    labelText: 'Search',

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: const Icon(Icons.search),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field must be not Empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {

                    NewsCubit.get(context).getSearch(value);

                  },
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
