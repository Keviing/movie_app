
import 'package:movie_app/domain/datasource/actor_datasource.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/repository/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  //La implementacion del repositorio espera resolver cada metodo por 
  //por lo que necesita un datasource, pero general no uno especifico 
  // entonces invocamos la abstraccion 

  final ActorDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
  
}