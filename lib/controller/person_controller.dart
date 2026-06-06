import 'package:flutter/material.dart';
import 'package:requisition_http_byhttp/message_states.dart';
import 'package:requisition_http_byhttp/model/person_dto.dart';
import 'package:requisition_http_byhttp/model/person_model.dart';
import 'package:requisition_http_byhttp/service/api_client.dart';


class PersonController extends ChangeNotifier{ 
  List<Person> _person = [];
  List<Person> get person => _person;
  final apiClient = ApiClient();
  bool isLoading = false;
   ValueNotifier<MessagesStates> mensagemNotifier =ValueNotifier(IddleMessage()); 




  void listarPessoas() async {
    isLoading = true;
    
    
    try {
      
      final person = await apiClient.get();
      _person =  person;
       notifyListeners();
    } on Exception catch (error) {
       mensagemNotifier.value =
          ErrorMessage(message: "ocorreu um erro ao buscar pessoas.");
     
      print("error: $error");
    } finally {
      isLoading = false;
      
      notifyListeners();
    }
  }

  Future<void> adicionarPessoa(PersonDto createPerson) async {
 
     
      try{
      
      final personAdd = await apiClient.post(createPerson); 

      _person.add(personAdd); //Vai adicionar na lista.
      mensagemNotifier.value =
          SuccessMessage(message: "Pessoa adicionada com sucesso.");
     
      notifyListeners();
      }
      on Exception catch (_) {//Foi adeirido na aula de ajuste de injeção de dependencia. error foi substituido porquenão está em uso.
      mensagemNotifier.value =
          ErrorMessage(message: "Ocorreu um erro ao adicionar pessoa");
    }
    
  }

 Future<void> removerPessoa(Person pessoa) async {
    try {
      await apiClient.delete(pessoa);
      _person.remove(pessoa);
      mensagemNotifier.value =
          SuccessMessage(message: "Pessoa removida com sucesso.");
    
       } on Exception catch (_) {//Foi adeirido na aula de ajuste de injeção de dependencia. error foi substituido porquenão está em uso.
      mensagemNotifier.value =
          ErrorMessage(message: "Ocorreu um erro ao remover pessoa");
    } finally {
      notifyListeners();
    }
   }
 
 Future<void> atualizarPessoa(Person criarPessoa) async {
    try {
      final pessoa = await apiClient.put(criarPessoa);

      final pessoaIndex = _person.indexWhere((e) => e.id == pessoa.id);

      _person[pessoaIndex] = pessoa;

      mensagemNotifier.value =
          SuccessMessage(message: "Pessoa atualizada com sucesso.");
    // } on Exception catch (error) {
       } on Exception catch (_) {//Foi adeirido na aula de ajuste de injeção de dependencia. error foi substituido porquenão está em uso.
        mensagemNotifier.value =
          ErrorMessage(message: "Ocorreu um erro ao atualizar pessoa");
    } finally {
      notifyListeners();
    }
  }
  







}