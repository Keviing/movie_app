import 'package:dio/dio.dart';
import 'package:movie_app/config/constant/enviroment.dart';
import 'package:movie_app/domain/datasource/actor_datasource.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/infrastructure/mappers/actor_mapper.dart';
import 'package:movie_app/infrastructure/models/Cast/credit_response.dart';

class ActordbDatasource extends ActorDatasource {

  //aQUI VA LA IMPLEMENTACION DE LOS METODOS 
  //ES DECIR LAS SOLICITUDES HTTP 

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key' : Enviroment.theMovieDbKey,
        'language' : 'es-MX'
      }
      )
  );

  


  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {

    final response = await dio.get('/movie/$movieId/credits');

    CreditsResponse creditResponse = CreditsResponse.fromJson(response.data) ;

    return  creditResponse.cast.map((actor) => ActorMapper.creditToEntity(actor)).toList();
  }
  
}