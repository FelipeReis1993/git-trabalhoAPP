
//Importação da biblioteca (equivalente ao include)


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_dm/cadastro.dart';
import 'package:trabalho_dm/compra.dart';
import 'package:trabalho_dm/login_page.dart';
import 'package:trabalho_dm/tela_home.dart';
import 'package:trabalho_dm/tela_principal.dart';
import 'package:trabalho_dm/tela_provas.dart';
import 'package:trabalho_dm/usuarios.dart';


//
// BLOCO PRINCIPAL
//
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Iniciar a execução do App
  runApp(

    //Definir qual UI será carregada
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concursando Elétrica',
      initialRoute: 'principal',
      routes: {
        'login' :(context)=> LoginPage(),
        'cadastro' :(context)=> CadastroPage(),
        
        'principal' :(context)=> TelaPrincipal(),
        'home':(context)=> TelaHome(),
        'usuarios' :(context)=> TelaUsers(),
        'compras' :(context)=> PageComprar(),
        'provas' :(context)=> TelaProvas(),
      
      },
      
    ),
    
  );

}

