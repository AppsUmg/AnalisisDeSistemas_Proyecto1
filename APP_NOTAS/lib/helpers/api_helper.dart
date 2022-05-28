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
 var DecodeJson = jsonDecode(body) ; 

  if(response.statusCode >=  400) {
    print("NOTA:  ESTATUS MAL");
     return ListaNotas;
  }

   
  //var Aux = jsonDecode(body) ;   

  if(response.statusCode ==  200) {
//print("NOTA: ESTATUS 200");
//   print(DateTime.now().toString());
//   print(Note.noteFromJson(DecodeJson));
//ListaNotas = Note.noteFromJson(DecodeJson);
   String AuxString="";
  final String JsonString = DecodeJson.toString();

    int v1=0;
    bool v2=false;
    int v3=0;
    String v4="";
    String v5="";
    DateTime v6;

  print(JsonString.length.toString()+"/0");
 String R="";
for (int i = 0; i < JsonString.length; i++) {
  
  if(R.contains("id:")){
    if(R.toString().contains(",")){
      v1 = int.parse(AuxString);
      print("RESULTADO id:"+AuxString.toString());
      AuxString = "";
      R="";
    }else{
     if(JsonString[i].toString().contains(",")!=true){
        AuxString += JsonString[i].toString();
      }
    }
  }

  if(R.contains("isImportant:")){
    if(R.toString().contains(",")){
    if (AuxString.toLowerCase() == 'true') {
      v2 =  true;
    } else if (AuxString.toLowerCase() == 'false') {
       v2 = false;
    }
      print("RESULTADO isImportant:"+AuxString.toString());
      AuxString = "";
      R="";
    }else{
     if(JsonString[i].toString().contains(",")!=true){
        AuxString += JsonString[i].toString();
      }
    }
  }

  if(R.contains("number:")){
    if(R.toString().contains(",")){
      v3 = int.parse(AuxString);
      print("RESULTADO number:"+AuxString.toString());
      AuxString = "";
      R="";
    }else{
     if(JsonString[i].toString().contains(",")!=true){
        AuxString += JsonString[i].toString();
      }
    }
  }

if(R.contains("title:")){
    if(R.toString().contains(",")){
      v4 = AuxString;
      print("RESULTADO title:"+AuxString.toString());
      AuxString = "";
      R="";
    }else{
     if(JsonString[i].toString().contains(",")!=true){
        AuxString += JsonString[i].toString();
      }
    }
  }

if(R.contains("description:")){
    if(R.toString().contains(",")){
      v5 = AuxString;
      print("RESULTADO description:"+AuxString.toString());
      AuxString = "";
      R="";
    }else{
     if(JsonString[i].toString().contains(",")!=true){
        AuxString += JsonString[i].toString();
      }
    }
  }

if(R.contains("createdTime:")){
    if(R.toString().contains(",")){
      v6 =DateTime.now() ;
      print("RESULTADO createdTime:"+AuxString.toString());
      AuxString = "";
      R="";
 Note NOTA = Note(
      id: v1,
      title: v4,
      isImportant: v2,
      number: v3,
      description: v5,
      createdTime: v6,
    );
    print(NOTA.toString() );
       ListaNotas.add(NOTA);
      R="";
      AuxString = ""; 
    }else{
     if(JsonString[i].toString().contains(",")!=true || JsonString[i].toString().contains("}")!=true ){
        AuxString += JsonString[i].toString();
      }
    }
  }

  
  R += JsonString[i].toString();
}

print(ListaNotas.toString());

  



    //ListaNotas = Json.map((Json) => Note.fromJson(Json)).toList();
   // print("NOTA:  ESTATUS OK"+ListaNotas.toString());
    //print("JSON: "+Json.toString());
    // ListaNotas.add(Note.fromJson(DecodeJson));
    // print("NOTA:  ESTATUS lista OK"+await DecodeJson.map((aux) => Note.fromJson(aux)).toList());
        //  Json.map((Json) => Note.fromJson(Json)).toList();

  //var data = json.decode(response.body) as Map;
  //var resultMap = data.cast<String, List<String>>();
 
  //var data = json.decode(DecodeJson) as Map;
  //var result = data.cast<String, String>();
  //print('RESULT_ '+result.toString());
  // ListaNotas.addAll(DecodeJson.map((aux) => Note.fromJson(aux)).toList());
  //print("Lista: "+ListaNotas.toString() );
   // var data = json.decode(DecodeJson) as Map;

  /*var result = data.map((key, value) =>
      MapEntry<String, List<String>>(key, List<String>.from(value)));
  print(result.runtimeType);
   */



    return ListaNotas;// response(isSuccess:true,result:Note.fromJson(Json));
  }          
} catch (e) { return ListaNotas;
      }
      print("NOTA: ERROR");
   return ListaNotas; 
   }
}









