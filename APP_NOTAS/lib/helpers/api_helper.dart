import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:note/global/Environment.dart';
import  'package:note/model/note.dart';
import 'package:note/helpers/constants.dart';

class ApiHelper {

Future<List<Note>> getNotes() async {

var url = Uri.parse('${Constans.ApiUrl}/api/Servicios');
final ListaNotas = <Note>[];


try { 
 
var response = await http.get(url,headers: {

    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

var body = response.body; 
  if(response.statusCode >=  400) {
     return ListaNotas;

  }
  var decodedJson = jsonDecode(body) ; 
    
  if(response.statusCode ==  200) {
    
    ListaNotas.add(Note.fromJson(decodedJson));
    
    return ListaNotas;


  }
   
            
} catch (e) { return ListaNotas;

      }
   return ListaNotas;
   
   }

}









