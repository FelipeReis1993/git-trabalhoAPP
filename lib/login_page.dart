
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

  final txtNome = TextEditingController();
  final txtSenha = TextEditingController();

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
                  campoTexto('Nome', txtNome),
                  campoTexto2('Senha', txtSenha),
                  
                  TextButton(
                    onPressed: () {
                     final nome = txtNome.text; 
                     final senha = txtSenha.text;

                     if(nome.isEmpty || senha.isEmpty){
                       showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Erro"),
                            content: Text("Login e/ou Senha invalido(s)"),
                            actions: <Widget> [
                              TextButton(
                                 child: Text("OK"),
                                onPressed: (){
                                  Navigator.pop(context);
                                }
                              ),
                            ],
                          );
                        },
                       );
                     }
                    else{
                      Navigator.pushReplacementNamed(context, 'principal');
                    } 
                      
                    },
                    child: Text('Entrar'),
                    ),
                    
                    TextButton(
                      child: Text('Cadastrar'),
                    onPressed: () {
                        
                    },
                    
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
        
        controller: variavel,
        decoration: InputDecoration(
          labelText: rotulo,
          
          hintText: 'Digite seu nome',
          
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
        controller: variavel,
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












}

