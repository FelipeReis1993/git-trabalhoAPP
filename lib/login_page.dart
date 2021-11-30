
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//
// Tela Principal
//
 class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() =>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Concursando Elétrica')),
      body: Container( 
         child: Column(
          children: [
            Container(
             margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
             width: double.infinity,
             height: 300,
             color: Colors.white24,
             child:  Column(
               children: [
                 new Image.asset(
                   'lib/imagens/con_eletr.jpeg',
                   height: 300,
                 )
               ],
             ),
            ),
            Container(
              color: Colors.white24,
              padding: EdgeInsets.all(10),
              child:Container(
                padding: EdgeInsets.all(50),
                color: Colors.white,
                child:Column(
                children: [
                  Text('Login'),
                  campoTexto('Email', txtEmail),
                  campoTexto2('Senha', txtSenha),
                  
                  TextButton(
                    child: Text('Entrar'),
                    onPressed: (){
                      setState(() {
                        isLoading  = true;
                      });
                      login(txtEmail.text, txtSenha.text);
                    },
                    ),
                    TextButton(
                      child: Text('Cadastrar'),
                      onPressed: (){
                        Navigator.pushNamed(context, 'cadastro');
                      }
                    ),
                ],
                ),
                ),             

            ),
          ],

        ),
         
          
          ),
        
      );
    
  }

Widget campoTexto(rotulo, variavel){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),

      child: TextFormField(
        
        controller: txtEmail,
        decoration: InputDecoration(
          labelText: rotulo,
          
          hintText: 'Digite seu Email',
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
 
    );
  }

  Widget campoTexto2(rotulo, variavel){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),

      child: TextFormField(
        obscureText: true,
        controller: txtSenha,
        decoration: InputDecoration(
          labelText: rotulo,
          
          hintText: 'Digite sua senha',
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
 
    );
  }


void login(email, senha){

    FirebaseAuth.instance.signInWithEmailAndPassword
    (email: email, password: senha).then((value) {

      Navigator.pushReplacementNamed(context, 'principal');

    }).catchError((erro){

      if (erro.code == 'user-not-found'){
        exibirMensagem('ERRO: Usuário não encontrado.');
      }else if (erro.code == 'wrong-password'){
        exibirMensagem('ERRO: Senha incorreta.');
      }else if (erro.code == 'invalid-email'){
        exibirMensagem('ERRO: Email inválido.');
      }else{
        exibirMensagem('ERRO: ${erro.message}.');
      }

    });
    
  }

  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }









}

