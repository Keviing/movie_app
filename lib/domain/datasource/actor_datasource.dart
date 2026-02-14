//Quiero crear una abtraccion un contrato o forma que deben tener las clases que hereden de ella 

import 'package:movie_app/domain/entities/actor.dart';

abstract class ActorDatasource {

  Future<List<Actor>> getActorByMovie(String movieId);

}
