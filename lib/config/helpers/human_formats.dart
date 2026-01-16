
//Declaramos la clase 
import 'package:intl/intl.dart';

class HumanFormats {
//Creamos un metodo en esa clase que sea statica para poder usarla 
//sin necesidad de instanciar la clase 

static String number(double number){

  final formatedNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
    locale: 'en_US'

  ).format(number);
  return formatedNumber;
}

}