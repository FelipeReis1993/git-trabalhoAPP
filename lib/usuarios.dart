import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TelaUsers extends StatefulWidget {
  const TelaUsers({ Key? key }) : super(key: key);

  @override
  _TelaUsersState createState() => _TelaUsersState();
}

class _TelaUsersState extends State<TelaUsers> {
  late CollectionReference users;

  @override
  void initState(){
    super.initState();

    users = FirebaseFirestore.instance.collection('users');
  }

  exibirItemColecao(item){

   String nome = item.data()['nome'];
   String email = item.data()['email'];
    

    return ListTile(
      title: Text(nome, style: const TextStyle(fontSize: 30),),
      subtitle: Text(email, style: const TextStyle(fontSize: 25),),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          //
          // APAGAR um documento
          //
          users.doc(item.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, 'cadastro', arguments: item.id);
      },


    );

        
          

    

  }








  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
            },
            icon: Icon(Icons.logout),
            )
        ],),


        body: StreamBuilder<QuerySnapshot>(
        //fonte de dados (coleção)
        stream: users.snapshots(),

        //exibir os dados retornados
        builder: (context, snapshot){

          //verificar o estado da conexão
          switch(snapshot.connectionState){

            case ConnectionState.none:
              return const Center(child: Text('Não foi possível conectar ao Firestore'),);

            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(),);

            //se os dados foram recebidos com sucesso
            default:
              final dados = snapshot.requireData;
              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index){
                  return exibirItemColecao(dados.docs[index]);
                }
              );

          }


        }

      ),




      


      
    );
  }
}