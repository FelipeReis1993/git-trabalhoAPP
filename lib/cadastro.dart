
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//
// Tela Principal
//
 class CadastroPage extends StatefulWidget {
  const CadastroPage({ Key? key }) : super(key: key);

  @override
  _CadastroPageState createState() =>_CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage>{

  late CollectionReference users;

  @override
  void initState(){
    super.initState();

    users = FirebaseFirestore.instance.collection('users');
  }

 
  var txtNome = TextEditingController();
  var txtCPF = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();


  getDocumentById(id) async{
    await FirebaseFirestore.instance.collection('users')
      .doc(id).get().then((doc) {
        txtNome.text = doc.get('nome');
        txtCPF.text = doc.get('cpf');
        txtEndereco.text = doc.get('endereco');
        txtEmail.text = doc.get('email');
        txtSenha.text = doc.get('senha');
        
      });
  }
  
  

  @override
  Widget build(BuildContext context) {

    var id = ModalRoute.of(context)?.settings.arguments;
    if (id != null){
      if (txtNome.text.isEmpty && txtCPF.text.isEmpty && txtEndereco.text.isEmpty && txtEmail.text.isEmpty && txtSenha.text.isEmpty){
        getDocumentById(id);
      }
    }




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
              obscureText: true,
              controller: txtSenha,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: txtNome,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtCPF,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'CPF',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: txtEndereco,
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Endereço',
              ),
            ),
            SizedBox(height: 20),
             
              

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('Criar'),
                    onPressed: () {

                      
                      criarConta(
                        txtEmail.text,
                        txtSenha.text,
                        txtNome.text,
                        txtCPF.text,
                        txtEndereco.text,
                        id,
                
                      );
                      
            
                        
                        

                      
                      
                    },
                  ),
                ),
                Container(
                  width: 150,
                  child: OutlinedButton(
                    child: Text('cancelar'),
                    onPressed: () {
                      if(id == null){
                        Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                      
                      }else{
                        Navigator.pushNamed(context, 'usuarios');
                        
                       
                      }

              
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

void criarConta(email, senha, nome, cpf, endereco, id) {
  if (id == null) {
    
  

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
            exibirMensagem('Usuário criado com sucesso!');
            Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
        }).catchError((erro){
          if (erro.code == 'email-already-in-use'){
            exibirMensagem('ERRO: O email informado está em uso.');
          }else if (erro.code == 'invalid-email'){
            exibirMensagem('ERRO: Email inválido.');
          }else{
            exibirMensagem('ERRO: ${erro.message}');
          }
        });

        FirebaseFirestore.instance.collection('users').doc(email).set({
          'nome' :nome,
          'cpf': cpf,
          'endereco': endereco,
          'email' :email,
          'senha' :senha,
          });
  }else{

        FirebaseFirestore.instance.collection('users').doc(id.toString()).set({
         'nome' :nome,
         'cpf': cpf,
         'endereco': endereco,
         'email' :email,
         'senha' :senha,
                      });

  }

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


