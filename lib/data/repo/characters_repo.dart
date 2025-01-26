import 'package:bloc_project/data/models/character.dart';
import 'package:bloc_project/data/web_services/characters_web_services.dart';

class CharactersRepo {

 final CharactersWebServices charactersWebServices ;

 CharactersRepo(this.charactersWebServices);

 Future<List<Character>> getAllCharactersFromWebService() async{

   final characters = await charactersWebServices.getAllCharactersFromServer();

   return characters.map((char)=>Character.fromJson(char)).toList();

 }

}