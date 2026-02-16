
import 'package:movie_app/domain/entities/actor.dart';

abstract class ActorRepository {

    Future<List<Actor>> getActorByMovie(String movieId);

}