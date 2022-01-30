import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/cubit/news_cubit/news_states.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  List<BottomNavigationBarItem>  bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  void changeBottomItems(int index){
    currentIndex = index;

    if(index ==1)
    {
      getSports();
    }
    else if (index ==2)
    {
      getScience();
    }
    emit(NewsNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness()
   {
    emit(NewsBusinessLoadingState());

    if(business.length ==0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apiKey':'978166dc49544441ae0cb71698cc8637',
          })
          .then((value) {
        print('value.data1');
        business = [value?.data['articles']];
        print(business[0][0]['urlToImage']);
        print('data received successfully');

        emit(NewsGetBusinessSuccessState());
      })
          .catchError( (error)
      {print('catch error in => ${error.toString()}');
      emit(NewsGetBusinessErrorState());
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }

  }



  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsSportsLoadingState());
    if(sports.length ==0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'978166dc49544441ae0cb71698cc8637',
          })
          .then((value) {
        print('value.data1');
        sports = [value?.data['articles']];
        print(sports[0][0]['title']);
        print('data received successfully');

        emit(NewsGetSportsSuccessState());
      })
          .catchError( (error)
      {print('catch error in => ${error.toString()}');
      emit(NewsGetSportsErrorState());
      });
    } else{
      emit(NewsGetSportsSuccessState());

    }
  }



  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsScienceLoadingState());

    if(sports.length ==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'978166dc49544441ae0cb71698cc8637',
          })
          .then((value) {
        print('value.data1');
        science = [value?.data['articles']];
        print(science[0][0]['urlToImage']);
        print('data received successfully');

        emit(NewsGetScienceSuccessState());
      })
          .catchError( (error)
      {print('catch error in => ${error.toString()}');
      emit(NewsGetScienceErrorState());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }



  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '978166dc49544441ae0cb71698cc8637',
        })
        .then((value) {
      print('value.data1');
      search = [value?.data['articles']];
      print(search[0][0]['urlToImage']);
      print('data received successfully');

      emit(NewsSearchSuccessState());
    })
        .catchError((error) {
      print('catch error in => ${error.toString()}');
      emit(NewsSearchErrorState());
    });
  }
}