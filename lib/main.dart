
//Importação da biblioteca (equivalente ao include)


import 'package:flutter/material.dart';
import 'package:trabalho_dm/login_page.dart';
import 'package:trabalho_dm/tela_home.dart';
import 'package:trabalho_dm/tela_principal.dart';

//
// BLOCO PRINCIPAL
//
void main(){

  //Iniciar a execução do App
  runApp(

    //Definir qual UI será carregada
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concursando Elétrica',
      initialRoute: 'login',
      routes: {
        'login' :(context)=> LoginPage(),
        'principal' :(context)=> TelaPrincipal(),
        'home':(context)=> TelaHome(),
      },
      
    ),
    
  );

}

