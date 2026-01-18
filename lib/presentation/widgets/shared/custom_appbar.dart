import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: (){}, 
                icon: Icon(Icons.search) 
                ),
            ],
          ),
        ),
        ) ;
  }
}