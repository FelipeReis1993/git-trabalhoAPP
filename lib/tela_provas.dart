import 'dart:js';

import 'package:flutter/material.dart';


 class TelaProvas extends StatefulWidget {
  const TelaProvas({ Key? key }) : super(key: key);

  @override
  _TelaProvasState createState() =>_TelaProvasState();
}

class _TelaProvasState extends State<TelaProvas>{

  var lista = [];

  //retornar a tarefa adicionada pelo usuário
  var txtTarefa = TextEditingController();

  @override

  void initState() {
    lista.add("Instalações Elétricas");
    lista.add("Máquinas Elétricas");
    lista.add("Projeto Elétrico");
    lista.add("Eletrônica");
    lista.add("Segurança no Trabalho");
    lista.add("Eletromagnetismo");
    lista.add("Geração e Distribuição de Energia Elétrica");
    lista.add("Sistemas Elétricos");
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      appBar: AppBar(
        title: Text('Bem Vindo.'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
            },
            icon: Icon(Icons.logout),
            )
        ],),

        body: Container(
          child:ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context,index){
              return Card(
                color: Colors.blue.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(15),
                   ),

                child: ListTile(
               
                title: Text(
                  lista[index],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.east_rounded),
                  onPressed:(){

                  },
                ),
                
              ),
              );
            },
          ),
          ),


    );
}
}