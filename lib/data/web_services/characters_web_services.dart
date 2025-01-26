import 'package:bloc_project/constant/api_url.dart';
import 'package:bloc_project/data/models/character.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {


 late Dio dio ;

 CharactersWebServices(){

   BaseOptions options = BaseOptions(
     baseUrl: ApiUrl.baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout:const Duration(seconds: 20),
     receiveTimeout: const Duration(seconds: 20)
   );

   dio = Dio(options);
 }

 Future<List<dynamic>> getAllCharactersFromServer() async{
   try {
     Response response = await dio.get(ApiUrl.allCharacters);
     return response.data;
   }catch(e){
     return [] ;
   }
 }



}