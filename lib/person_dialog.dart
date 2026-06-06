import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requisition_http_byhttp/controller/person_controller.dart';
import 'package:requisition_http_byhttp/model/person_model.dart';
import 'package:requisition_http_byhttp/register.dart';


class PersonDialog extends StatelessWidget {
   //final void Function(Pessoa pessoa) onDeletePessoa;//Aula da lista. Para deletar uma lista.Somente essa linha
  final Person person;
  const PersonDialog({
    super.key,
    required this.person,
    //required this.onDeletePessoa,//Aula da lista. Para deletar uma lista. Somente essa linha.
  });

  @override
  Widget build(BuildContext context) {
    final personController = context.read<PersonController>(); //Provider
    return AlertDialog(
       
      actions: [//Ao inves de colocar no final o actions permite que coloque no topo mas que os itens ficam no final.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                 
              onPressed: () async{
                
                await personController.removerPessoa(person); 
                //Navigator.of(context).pop();
                if (context.mounted) Navigator.of(context).pop(); //Delete do http.Verifica se o contexto ainda está montado antes de tentar fechar o diálogo. Isso é importante para evitar erros caso o usuário tenha fechado a tela ou navegado para outra página antes da conclusão da operação de exclusão.
              },
              child: Text(
                
                  "Excluir", 
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
               ElevatedButton(
              
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () async {
                // Navigator.of(context).pushNamed(
                //   Routes.register,
                //   arguments: {
                //     "person": person,
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register(person: person,))); //Sem ser pelo router e seu parametro.
                    
                //   },
                // );
                
              },
              child: Text(
                "Editar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Fechar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
      content: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Informações do usuário"),
             Text(
              "Informações do usuário",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 8),
           //Provem do default_dialog_container.dart
           Text("Id: ${person.id}"),
            SizedBox(height: 8),
            
           Text("Nome: ${person.name}"),
            SizedBox(height: 8),
            
           Text("Peso: ${person.age}"),//Atributo criado em extensions.dart
            SizedBox(height: 8),
            
           Text("altura: ${person.email}"),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}