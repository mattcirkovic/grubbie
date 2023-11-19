import 'dart:async';

class Recipe{
  final int idrecipe;
  final String name;

  Recipe({
    required this.idrecipe,
    required this.name
  });

  Map<String, dynamic> toMap() {
    return {
      'idrecipe': idrecipe,
      'name': name,
    };
  }
}