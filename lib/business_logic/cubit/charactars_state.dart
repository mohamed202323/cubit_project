import 'package:bloc_project/data/models/character.dart';
import 'package:flutter/material.dart';



@immutable
abstract class CharactarsState {}

class CharactarsInitial extends CharactarsState {}

class CharactarsLoading extends CharactarsState {}

class CharactarsLoaded extends CharactarsState {
  final bool isSearch ;
  final List<Character> characters;
  CharactarsLoaded(this.characters, this.isSearch);
}

class CharactarsError extends CharactarsState {
  final String message;

  CharactarsError(this.message);
}
