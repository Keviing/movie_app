//Creamos un provider con para acceder a las implementaciones de los metodos 
//Provider inmutable (osea no va a cambiar)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/actordb_datasource.dart';
import 'package:movie_app/infrastructure/repository/actor_repository_impl.dart';

final actorProvider = Provider(
  (ref) => ActorRepositoryImpl(ActordbDatasource())
  );