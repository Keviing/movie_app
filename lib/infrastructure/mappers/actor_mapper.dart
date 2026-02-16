
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/infrastructure/models/Cast/credit_response.dart';

class ActorMapper {
  
  static Actor creditToEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null 
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    :
    'https://cdn-icons-png.flaticon.com/512/6134/6134065.png', 
    character: cast.character
    );
}