import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:note/global/Environment.dart';
import  'package:note/model/note.dart';
import 'package:note/helpers/constants.dart';
import 'dart:convert';


class ApiHelper {

static Future<List<Note>> getNotes() async {
  
var url = Uri.parse('${Constans.ApiUrl}/api/Servicios');
List<Note> ListaNotas = [];
try { 
var response = await http.get(url,headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

var body = response.body; 

  if(response.statusCode >=  400) {
     return ListaNotas;
  }
  if(response.statusCode ==  200) {
try {
 ListaNotas = noteFromMap(body);
} on Exception catch (e,stacktrace) {

} catch (e,stacktrace) {
  print('Exception: ' + e.toString());
  print('Stacktrace: ' + stacktrace.toString());
}
    return ListaNotas;
  }          
} catch (e) { return ListaNotas;
      }
   return ListaNotas; 
   }
}









