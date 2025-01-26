import 'package:bloc_project/constant/images_name.dart';
import 'package:bloc_project/data/models/character.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class ViewCharacters extends StatelessWidget{

  final List<Character> listData ;

  ViewCharacters({required this.listData});

  @override
  Widget build(BuildContext context) {
     return
       Container(
         padding: const EdgeInsets.only(top:8),
         height: MediaQuery.sizeOf(context).height-92.5,
         color: AppColors.grey,
         child: GridView.builder(
           // shrinkWrap: true,
             gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 1,
                 crossAxisSpacing: 1,
                 childAspectRatio: 2/3
             ),
             itemCount: listData.length,
             itemBuilder: (context,index)=>Container(
               padding: EdgeInsets.all(4),
               margin: const EdgeInsets.all(5),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: AppColors.white
               ),
               child: GridTile(
                 footer: Container(
                   padding: EdgeInsets.all(8),
                   color: Colors.black54,
                   alignment:Alignment.bottomCenter,
                   child: Text(listData[index].fullName!,style: const TextStyle(
                       height: 1.6,
                       fontSize:16,
                       color: AppColors.white,
                       overflow: TextOverflow.ellipsis

                   ),),

                 ),
                 child:Container(
                   color: AppColors.grey,
                   child: FadeInImage(
                     placeholder: const AssetImage(ImagesName.loading),
                     image: NetworkImage("${listData[index].imageUrl}"),
                     fit: BoxFit.cover,
                     imageErrorBuilder: (context, error, stackTrace) {
                       return Image.asset(
                         ImagesName.loading,
                         fit: BoxFit.cover,
                       );
                     },
                   ),
                 ),
               ),
             ))
     );
   }

  }
