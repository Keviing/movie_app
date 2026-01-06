import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDbKey = dotenv.env['THE_MOVIE_KEY'] ?? 'sin api key';
}