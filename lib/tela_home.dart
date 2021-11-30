import 'package:flutter/material.dart';


 class TelaHome extends StatefulWidget {
    
  const TelaHome({ Key? key } ) : super(key: key);

  //String get title => null;

  @override
  _TelaHomeState createState() =>_TelaHomeState();
}



class _TelaHomeState extends State<TelaHome>{
  @override
  Widget build(BuildContext context, ) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      
      appBar: AppBar(
        title: Text('Bem vindo'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
            },
            icon: Icon(Icons.logout),
          )
        ],
        ),
        
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Container(
                  margin: EdgeInsets.all(5),
                  width: 270,
                  height: 490,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('FELIPE DOMICIANO REIS',style:
                      TextStyle(
                       fontWeight: FontWeight.bold,
                       fontFamily: 'fontelight',
                       fontSize: 18,
                       )
                       ),
                      new Image.asset(
                     'lib/imagens/minha_foto.jpeg',
                     height: 200,
                   )
        
                    ],),
                  
                ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 200,
                    height: 490,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Aplicativo desenvolvido para melhorar o acesso aos conteudos de provas de concurso na área da Elérica',style: 
                        TextStyle(fontWeight: FontWeight.bold, fontFamily: 'fontelight',fontSize: 18,),),
                        
                          
                          
                      ],
                    ),
                    
        
        
                  ),
                ],),  
        
            ],
            ),
        ),
    );
 }
}