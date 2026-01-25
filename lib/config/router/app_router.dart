
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/movie/movie_only_screen.dart';
import 'package:movie_app/presentation/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: MovieScreen.name,
      builder: (context, state) => MovieScreen(),
      //Puedo definir rutas hijas de la ruta preincpial para que me permita mostrar el boton de retroceso 
      routes: [
         GoRoute(
      path: 'movie/:id',
      name: MovieOnlyScreen.name,
      builder: (context, state) {
        //Vamos a obtener el parametro del state 
        final String movieId= state.pathParameters['id'] ?? 'no-id';    
        return MovieOnlyScreen(movieId:movieId );
      },)
      ]
      ),
      //Aqui es una ruta indeopendiente 
    // GoRoute(
    //   path: '/movie/:id',
    //   name: MovieOnlyScreen.name,
    //   builder: (context, state) {
    //     //Vamos a obtener el parametro del state 
    //     final String movieId= state.pathParameters['id'] ?? 'no-id';    
    //     return MovieOnlyScreen(movieId:movieId );
    //   },
      // ),
  ]
  );