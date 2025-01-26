import 'package:bloc_project/app_router.dart';
import 'package:bloc_project/business_logic/cubit/charactars_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomAppBar extends StatelessWidget{

  bool isSearch = false ;

  CustomAppBar({required this.isSearch}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      padding: const EdgeInsets.all(8),
      decoration:BoxDecoration(
        color:Colors.grey.shade100 ,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width:1)
      ) ,
      child:isSearch?
      Row(
        children: [
          Expanded(child:TextFormField(
            autofocus: true,
            decoration:const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              hintText: "Search ... ",
              border:InputBorder.none
            ),
            onChanged: (val){
              context.read<CharactarsCubit>().searchCharacters(val);
              if(val.isEmpty){
                context.read<CharactarsCubit>().closeSearchBarShow();
              }
            },
          )
          ),
          IconButton(onPressed:(){
            context.read<CharactarsCubit>().closeSearchBarShow();

          }
              , icon: const Icon(Icons.close))
        ],
      ):
      Row(
        children: [
          Expanded(child: const Text(" Characters",style: TextStyle(
              fontSize: 18,
              height:2.4
          ),
            textAlign: TextAlign.start,)
          ),
          IconButton(onPressed:(){
            context.read<CharactarsCubit>().openSearchBarShow();
          }
              , icon: const Icon(Icons.search))
        ],
      )
    );
  }


}