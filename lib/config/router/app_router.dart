
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: MovieScreen.name,
      builder: (context, state) => MovieScreen(),
      ),
  ]
  );