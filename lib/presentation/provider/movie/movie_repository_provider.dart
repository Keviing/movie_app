
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/datasource/movie_datasource.dart';
import 'package:movie_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movie_app/infrastructure/repository/movie_repositoy_impl.dart';

//Provider  se utuliza para tipo inmutables es decir que no van a cambiar despues de la compilacion 
final movieRepositoryProvider = Provider((ref) => MovieRepositoyImpl(MoviedbDatasource()));