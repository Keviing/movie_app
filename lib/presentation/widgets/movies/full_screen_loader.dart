import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  //Metodo que me retorna un stream 
  Stream<String> getLoadingMessage(){
    final listMessage = <String>[
    'Cargando Peliculas',
    'Comprando palomitas',
    'Buscando tus favoritos',
    'Ya merito...',
    'Un momento, no te vayas..',
    'Esto ya esta tardando mas de lo normal'
  ];

  return Stream.periodic(Duration(milliseconds: 1200), 
  (computationCount) => listMessage[computationCount],
  ).take(listMessage.length);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Espere Porfavor...'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2,),
          StreamBuilder(
            stream:getLoadingMessage() , 
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Text('Primera carga');
              }

              return Text(snapshot.data!);
            },
            )
        ],
      ),
    );
  }
}