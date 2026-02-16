
//creamos el provider 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/presentation/provider/actor/actor_provider.dart';

//Creamos un provider que consulte el listado de actores 
//Provider no inmutable 

final listActor = NotifierProvider<ActorsMovie, Map<String,List<Actor>>>(() => ActorsMovie() ,);

//Clase que puedde consulta listado de actores 
class ActorsMovie extends Notifier<Map<String,List<Actor>>> {

  @override
  Map<String,List<Actor>> build() {
    return {};
  }

  //Metodo de consulta 
  Future<void> getActorsMovie(String movieId )async{

    if(state[movieId] != null) return;

      final actorsMovie = await ref.read(actorProvider).getActorByMovie(movieId);

    state ={...state, movieId:actorsMovie};
  }
  
}