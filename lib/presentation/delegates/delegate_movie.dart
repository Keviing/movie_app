import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';

class DelegateMovie extends SearchDelegate<Movie?> {
  //Cambiar el texto dentro del text filed 

  @override
  String get searchFieldLabel => 'Buscar película';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '', 
          icon: Icon(Icons.clear)
          ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        return close(context, null); 
      }, 
      icon: Icon(Icons.arrow_back_ios_new))
      ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions');
  }
  
}