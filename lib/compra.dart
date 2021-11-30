import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageComprar extends StatefulWidget {
  const PageComprar({ Key? key }) : super(key: key);

  @override
  _PageComprarState createState() => _PageComprarState();
}

class _PageComprarState extends State<PageComprar> {

  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtMateria = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      backgroundColor: Colors.blue.shade400,
       automaticallyImplyLeading: false,
      
        title: Text('Bem Vindo'),
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
        padding: EdgeInsets.all(50),
        child: ListView(
          children: [
            TextField(
              controller: txtEmail,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              
              controller: txtNome,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 40),
            TextField(
              
              controller: txtMateria,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Materia',
              ),
            ),
            SizedBox(height: 40),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('Comprar'),
                    onPressed: () { 
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Comprar"),
                            content: Text("Deseja finalizar compra?"),
                            actions: [
                              OutlinedButton(
                              child: Text('Sim'),
                                onPressed: (){
                                FirebaseFirestore.instance.collection('compras').add({
                                'nome' :txtNome.text,
                                'email': txtEmail.text,
                                'materia': txtMateria.text,
                                
                                });
                                showDialog(
                                  context:context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Parabéns Pela Compra"),
                                      content: Text("Parabéns Pela compra, logo as provas chegará no seu email."),
                                      actions: [
                                        OutlinedButton(
                                          child: Text('OK'),
                                          onPressed: (){
                                            Navigator.pushNamed(context, 'principal');
                                          },
                                        )
                                      ],

                                    );
                                  }
                                );
                          },
                        ),
                        OutlinedButton(
                          child: Text('Não'),
                          onPressed: (){
                            Navigator.pushNamed(context, 'principal');
                          },

                        )

                            ],

                          );

                        }
                      );


                      
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                     Navigator.pushNamed(context, 'provas');

              
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
      
   
}