import 'package:dio/dio.dart';
import 'package:requisition_http_byhttp/model/person_dto.dart';
import 'package:requisition_http_byhttp/model/person_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
   final Dio dio = Dio();
  

  Future<List<Person>> get() async {
    
    
    final request = await http.get(
    Uri.parse('http://localhost:3000/person'),);
   
   if (request.statusCode == 200) {
      final data = jsonDecode(request.body);
      print(data);  
      

      
      final personsJson = data as List; //Primeiro é uma lista e dentro da lista tem um map.

        // return personsJson
        //   .map((personsJson) => Person(
        //     id: personsJson["id"],
        //     name: personsJson["name"],
        //     age: personsJson["age"],
        //     email: personsJson["email"],
        //   ),
        //   ).toList();


        // List<Person> persons = personsJson
        //   .map((e) => Person.fromJson(e)) //fromjson está no model pessoa.dart. É um factory. Pessoa é uma classe do arquivo pessoa.dart.
        //   .toList();

        //   return persons;


      return personsJson
          .map((e) => Person.fromJson(e)).toList();
    }

    throw Exception("Status Code inválido");
  }

  Future<Person> post(PersonDto criarPessoa) async {
   
    final request = await http.post(
    Uri.parse("http://localhost:3000/person"),
    headers: {
    'Content-Type': 'application/json',  //Indica que a requisição está enviando dados no formatoJson. No Headers tem varios outros tipos também.
     },
    body: jsonEncode(criarPessoa.toJson()),// Os dados que vão salvar.
    );

    if (request.statusCode == 201) {
      final data = jsonDecode(request.body);
      return Person.fromJson(data);
    }

    throw Exception("Status code inválido");
  }

Future<void> delete(Person pessoa) async{
  
   final request = await http.delete(
    Uri.parse("http://localhost:3000/person/${pessoa.id}"),
  );
  
  if (request.statusCode !=200) {
    throw Exception("Status code inválido");

  }
 }
 
  Future<Person> put(Person pessoa) async {

     final request = await http.put(
    Uri.parse("http://localhost:3000/person/${pessoa.id}"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(pessoa.toJson()),
    );
    
    if (request.statusCode == 200) {
      final data = jsonDecode(request.body);
      return Person.fromJson(data);
    }
    throw Exception("Status code invalido");
  }
}
