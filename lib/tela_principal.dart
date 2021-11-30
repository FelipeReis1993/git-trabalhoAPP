import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_dm/tela_concurso.dart';
import 'package:trabalho_dm/tela_home.dart';
import 'package:trabalho_dm/tela_provas.dart';
import 'package:trabalho_dm/tela_questao.dart';
import 'package:trabalho_dm/usuarios.dart';



class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

var telaAtual = 0;

var pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: pageController,
        children: [
          TelaHome(),
          TelaProvas(),
          TelaQuestao(),
          TelaConcurso(),
          TelaUsers(),

        ],
        onPageChanged: (index){

          setState(() {
            telaAtual = index;
          });
        },

        ),
    
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade900,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.40),

        selectedFontSize: 16,
        unselectedFontSize: 12,

        iconSize: 30,

        currentIndex: telaAtual,

        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Sobre',
             ),

            BottomNavigationBarItem(
            icon:Icon(Icons. auto_awesome_motion_outlined),
            label: 'Provas',
             ),

            BottomNavigationBarItem(
            icon:Icon(Icons.question_answer),
            label: 'Questões',
             ),

             BottomNavigationBarItem(
            icon:Icon(Icons.calendar_today_sharp ),
            label: 'Concursos ',
             ),

            BottomNavigationBarItem(
            icon:Icon(Icons.confirmation_num ),
            label: 'Usuários ',
             ),
        ],

          onTap: (index){
            setState(() {
              telaAtual = index;
            });

            pageController.animateToPage(
              index,
               duration: Duration(milliseconds: 200),
               curve: Curves.easeIn, 
               );

          },



        ),

     );


    
  }
}