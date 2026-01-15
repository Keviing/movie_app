import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [

        BottomNavigationBarItem(icon: Icon(Icons.home_max_sharp), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined, ), label: 'Categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined, ), label: 'Favoritos'),
    ]
  );
  }
}