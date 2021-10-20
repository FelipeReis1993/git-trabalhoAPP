

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_icons/flutter_icons.dart';

 class TelaConcurso extends StatefulWidget {
  const TelaConcurso({ Key? key }) : super(key: key);

  @override
  _TelaConcursoState createState() =>_TelaConcursoState();
}

class _TelaConcursoState extends State<TelaConcurso>{

   Future<void> _launchLink (String url) async{ 
      if (await canLaunch(url)) {
        await launch(url, forceWebView: false, forceSafariVC: false);
      }else{
        print('Não Pode Abrir o LInk $url');
      }
    }
  
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
body: Container(
  width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton.icon(
        icon: Icon(Icons.link, color: Colors.blue.shade400,),
        label: Text('Acesse nosso site e conheça nossa Página'),
        onPressed: () => _launchLink('http://concursandoeletrica.com.br/'),
      ),
      TextButton.icon(
        icon: Icon(Icons.link, color: Colors.red.shade400,),
        label: Text('Siga agente no nosso Instagram'),
        onPressed: () => _launchLink('https://www.instagram.com/concursando_eletrica/'),
      ),
      TextButton.icon(
        icon: Icon(Icons.link,color: Colors.green,),
        label: Text('Siga agente no nosso Facebook'),
        onPressed: () => _launchLink('https://www.facebook.com/ConcursandoEletrica'),
      ),
      TextButton.icon(
        icon: Icon(Icons.link,color: Colors.yellow,),
        label: Text('Clique para ver alguns concursos'),
        onPressed: () => _launchLink('https://editalconcursosbrasil.com.br/?cargo=engenheiro-eletricista'),
      ),
      TextButton.icon(
        icon: Icon(Icons.link,color: Colors.blue.shade900,),
        label: Text('Clique para ver alguns concursos'),
        onPressed: () => _launchLink('https://www.pciconcursos.com.br/vagas/engenharia-eletrica'),
      ),
      TextButton.icon(
        icon: Icon(Icons.link,color: Colors.purple,),
        label: Text('Clique para ver alguns concursos'),
        onPressed: () => _launchLink('https://especiais.g1.globo.com/economia/concursos-e-emprego/lista-de-concursos-publicos-e-vagas-de-emprego/'),
      ),
    ],),
),
    );
}

}


