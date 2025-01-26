
import 'package:bloc_project/business_logic/cubit/charactars_cubit.dart';
import 'package:bloc_project/constant/route_name.dart';
import 'package:bloc_project/data/repo/characters_repo.dart';
import 'package:bloc_project/data/web_services/characters_web_services.dart';
import 'package:bloc_project/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  late CharactersRepo charactersRepo ;
  late CharactarsCubit charactarsCubit ;

  AppRouter(){
    charactersRepo = CharactersRepo(CharactersWebServices());
    charactarsCubit = CharactarsCubit(charactersRepo);
  }



   Route<dynamic>? onGenerateRoute(RouteSettings routeSetting){
         
    switch(routeSetting.name){
      case RouteName.characterScreen :
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create: (context) => charactarsCubit..getAllCharactersFromRepo(),
          child: CharactersScreen(),
        ));

      default :
        return MaterialPageRoute(builder: (_)=>Placeholder());
    }


  }


}