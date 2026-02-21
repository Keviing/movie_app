import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/delegates/delegate_movie.dart';
import 'package:movie_app/presentation/provider/movie/movie_repository_provider.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme.primary;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return  Padding(
      
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity, // Esto significa toma todo el ancho disponible 
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors,),
              SizedBox(width: 5,),
              Text("Cinemapedia", style: titleStyle,),
              //Widget que se ayuda a crecr un espacio entre dos widgets 
              Spacer(),
              IconButton(
                onPressed: (){
                  final movieRepository = ref.read(movieRepositoryProvider);
                  showSearch(
                    context: context, 
                    delegate: DelegateMovie(movieSearch: movieRepository.searchMovie )
                    );
                }, 
                icon: Icon(Icons.search) 
                ),
            ],
          ),
        ),
        ) ;
  }
}