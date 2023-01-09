
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/diohelper/dioHelper.dart';
import 'package:untitled3/screens/buisness.dart';
import 'package:untitled3/screens/science.dart';
import 'package:untitled3/screens/sports.dart';

import '../models/newsModel.dart';
import 'cubitStates.dart';

class newsappManager extends Cubit<newsappstate>{

  newsappManager():super(InitialFootBallState());

  static newsappManager get(context)=>BlocProvider.of(context);

  List<String> titles=["Sports","Science","Business"];

  int current=0;

  List<Widget> screens=[
    Sports(),
    Science(),
    Buisness()
  ];

  bool searchcheck=false;

  void search(){
    searchcheck=!searchcheck;
    emit(Checksearch());
  }



  void bootomnav(index){
    current=index;
    if(index==0)
    GetSports();
    if(index==1)
      GetScience();
    if(index==2)
      Getbusines();
    emit(Changebottomstate());
  }

  FootBallModel? sports;
  List<Articles> sportss=[];

  void GetSports(){
    emit(loadingsportsDataState());

    DioHelper.GetData(path: "/v2/everything",queryparameters:<String,dynamic>{
      "q":"sports",
      "sortBy":"publishedAt",
    "apiKey":"832d153146f241cdabf83ce2d661eefe",
    "language":"en"
        } ).then((value) {
      sportss=[];
     sports=FootBallModel.fromjson(value!.data);
      sportss=sports!.articles;
  //    print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::)(::::::::::::::::::::::::::::::::::::::::::::::::::::");
      print(sportss![0]);
      emit(GetsportsDataSuccState());
    }).catchError((onError){
      print(onError.toString());
      emit(GetsportsDataErrorState());
    });
  }


  FootBallModel? science;
  List<Articles> sciencee=[];
  void GetScience(){
    emit(loadingScienceDataState());

    DioHelper.GetData(path: "/v2/everything",queryparameters:<String,dynamic>{
      "q":"science",
      "sortBy":"publishedAt",
      "apiKey":"832d153146f241cdabf83ce2d661eefe",
      "language":"en"
    } ).then((value) {
      sciencee=[];
      science=FootBallModel.fromjson(value!.data);
      sciencee=science!.articles;
      print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::)(::::::::::::::::::::::::::::::::::::::::::::::::::::");
      print(sciencee![0]);
      emit(GetScienceDataSuccState());
    }).catchError((onError){
      print(onError.toString());
      emit(GetScienceDataErrorState());
    });
  }


  FootBallModel? busines;
  List<Articles> Buisnes=[];
  void Getbusines(){
    emit(loadingbuisnessDataState());

    DioHelper.GetData(path: "/v2/everything",queryparameters:<String,dynamic>{
      "q":"business",
      "sortBy":"publishedAt",
      "apiKey":"832d153146f241cdabf83ce2d661eefe",
      "language":"en"
    } ).then((value) {
      Buisnes=[];
      busines=FootBallModel.fromjson(value!.data);
      Buisnes=busines!.articles;
      print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::)(::::::::::::::::::::::::::::::::::::::::::::::::::::");
      print(Buisnes![0]);
      emit(GetbuisnessDataSuccState());
    }).catchError((onError){
      print(onError.toString());
      emit(GetbuisnessDataErrorState());
    });
  }

  FootBallModel? searchmodel;
  List<Articles> searchlist=[];
  void Getsearchlist(String search){
    emit(loadingsearchDataState());

    DioHelper.GetData(path: "/v2/everything",queryparameters:<String,dynamic>{
      "q":search,
      "sortBy":"publishedAt",
      "apiKey":"832d153146f241cdabf83ce2d661eefe",
      "language":"en"
    } ).then((value) {
      searchlist=[];
      searchmodel=FootBallModel.fromjson(value!.data);
      searchlist=searchmodel!.articles;
      print(Buisnes![0]);
      emit(GetbsearchDataSuccState());
    }).catchError((onError){
      print(""""""""""""""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""""""""""""");
      print(onError.toString());
      emit(GetsearchDataErrorState());
    });
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}