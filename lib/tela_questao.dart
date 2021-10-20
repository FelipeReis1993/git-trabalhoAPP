import 'package:flutter/material.dart';


 class TelaQuestao extends StatefulWidget {
  const TelaQuestao({ Key? key }) : super(key: key);

  @override
  _TelaQuestaoState createState() =>_TelaQuestaoState();
}

class _TelaQuestaoState extends State<TelaQuestao>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container( 
               margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
               padding: EdgeInsets.all(30),
      
               decoration: BoxDecoration(
      
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
      
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
      
              gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
              ),
      
              
              
            ),
      
            width: MediaQuery.of(context).size.width * 0.90,
      
                  child: Column(
                    children: [
                      Container(
                        child:Column(
                          children:[
                      Text('Uma instalação elétrica alimentada por um único transformadoré composta por várias cargas iguais. Sabe-se que essa instalação possui fator de potência global de 0,8 e demanda média de 756 kW.Para que a máxima potência imposta ao transformador não ultrapasse 1.050 kVA, o fator de carga deve ser, no mínimo, igual a?', style: 
                      TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      )),
                      Text('(A) 0,78 ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('(B) 0,80',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('(C) 0,86',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('(D) 0,90',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('(E) 0,94',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      new Image.asset(
                           'lib/imagens/questao_1.PNG',
                           width: 800,
                           height: 400,
                         )
                          ],
                        ),
                      ),
                  Container(
                        child:Column(
                          children:[
                        Text('Em relação à projetos elétricos prediais, considere as afirmativas abaixo. ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('I – Não é permitido que emendas de condutores fiquem localizadas no interior de eletrodutos. ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('II – É permitido, em cômodos pequenos como despensas e depósitos, que a iluminação por ponto de luz na parede substitua a iluminação por ponto de luz no teto.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('III – É permitido, em habitações pequenas como quitinetes e suítes, que todos os pontos de luz e todas as tomadas decorrentes da habitação pertençam a um mesmo circuito terminal.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('Está correto o que se afirma em',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(A) I, apenas.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(B) III, apenas.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(C) I e II, apenas.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(D) II e III, apenas.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(E) I, II e III.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     
                      new Image.asset(
                           'lib/imagens/questao_2.PNG',
                           width: 800,
                           height: 400,
                         )
                          ],
                        ),
                      ),

                       Container(
                        child:Column(
                          children:[
                        Text('Considere um transformador monofásico ideal com as seguintes características: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('I - potência de 1000 VA; ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('II – tensão do circuito primário de 220 Volts;',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('III – tensão do circuito secundário de 110 Volts;',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('IV - número de espiras do secundário igual a 400.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('A respeito desse transformador, está CORRETO afirmar que o número de espiras do circuito primário é',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(A) a metade do secundário.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(B) igual à do secundário.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(C) o dobro daquela do secundário.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('(D) uma vez e meia a do secundário.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        
                     
                      new Image.asset(
                           'lib/imagens/questao_3.PNG',
                           width: 800,
                           height: 400,
                         )
                          ],
                        ),
                      ),
                    ],
                    
                    ),
                    
      
            ),
          ],
        ),
      ),
    );
}
}