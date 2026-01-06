import 'package:flutter/material.dart';
import 'package:movie_app/config/constant/enviroment.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'home-screen';
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Enviroment.theMovieDbKey),
      )
    );
  }
}