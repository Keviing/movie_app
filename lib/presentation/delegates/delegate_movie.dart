import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
  //creamos una funcion que realize la busqueda 
                                  //Retorno de mi funcion y mi funcion con parametro
  typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class DelegateMovie extends SearchDelegate<Movie?> {

  //agregamos la funcion al contructor de la clase delegate 
  final SearchMovieCallback movieSearch;

  DelegateMovie({required this.movieSearch});

  

  //Cambiar el texto dentro del text filed 
  @override
  String get searchFieldLabel => 'Buscar película';

  //Acciones en el lado derecho de la barra de busqueda
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

  //Acciones en el lado izquierdo de la barra de busqeda 
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
    
    return FutureBuilder(
      future:  movieSearch(query),
      builder: (context, snapshot) {
        
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
          );
      },
      );
  }
  
}