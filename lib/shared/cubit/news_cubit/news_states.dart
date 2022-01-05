abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsNavBarState extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}
class NewsSportsLoadingState extends NewsStates {}
class NewsScienceLoadingState extends NewsStates {}
class NewsSearchLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}
class NewsGetSportsSuccessState extends NewsStates {}
class NewsGetScienceSuccessState extends NewsStates {}
class NewsSearchSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {}
class NewsGetSportsErrorState extends NewsStates {}
class NewsGetScienceErrorState extends NewsStates {}
class NewsSearchErrorState extends NewsStates {}

