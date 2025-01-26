import 'package:bloc_project/business_logic/cubit/charactars_state.dart';
import 'package:bloc_project/data/models/character.dart';
import 'package:bloc_project/data/repo/characters_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactarsCubit extends Cubit<CharactarsState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];
  List<Character> filteredCharacters = [];
  bool isSearch = false ;

  CharactarsCubit(this.charactersRepo) : super(CharactarsLoading());

  void openSearchBarShow(){
    print(isSearch);
    emit(CharactarsLoaded(characters,true));
  }
  void closeSearchBarShow(){
    print(isSearch);
    emit(CharactarsLoaded(characters,false));
  }
  void getAllCharactersFromRepo() {
    charactersRepo.getAllCharactersFromWebService().then((characters) {
      this.characters = characters;
      emit(CharactarsLoaded(characters,false));
    }).catchError((error) {
      emit(CharactarsError(error.toString()));
    });
  }

  void searchCharacters(String query) {
    if (query.isEmpty) {
      emit(CharactarsLoaded(characters,true));
    } else {
      filteredCharacters = characters
          .where((character) => character.fullName!
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
      emit(CharactarsLoaded(filteredCharacters,true));
    }
  }
}
