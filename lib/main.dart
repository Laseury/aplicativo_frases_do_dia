import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var _frases = [
    "Eu prefiro errar do que não fazer nada",
    "Posso falhar, mas não vou desistir.",
    "Se estiverem esperando que eu desista, é bom esperarem sentados.",
    "Nunca torne-se um monstro para derrotar outro.",
    "Mamãe sempre dizia, Não perca! Quanto mais escura a noite... Mais brilhante as estrelas",
    "⁠Raiva dá motivação sem propósito.",
    "A dor é temporária, a vitória é eterna.",
    "Não importa quanto tempo você tem, mas como você o usa.",
    "A única morte verdadeira é nunca ter vivido.",
    "Existem erros que você não pode fazer duas vezes."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    //Gerar os numeros randomicos para as frases
    //Importar a classe Random no dath:math
    /*_frases.length é para randomizar com a quantidade de frases que tem escrito, se eu adicionar mais frases
    não precisarei acrescentar um novo valor pois já está definido no length*/
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      // o setState é para fazer com que o sistema mude o valor ou palavra antiga, tipo um novo DEFINI
      //Atrávés do Array "VETOR" ele irá retornar a frase que foi escolhida de forma randomica no comando anterior
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  var _titulo = "Frases do Dia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titulo),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(16),

                /*Serve para que o conteudo dentro do container fique ajustado para todo o espaço do celular 
            tanto no modo retrato como no modo Paisagem*/
                //width: double.infinity,

                //Serve para gerar uma Borda, no caso amarela para saber a dimensão do container.
                /*decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.amber)),*/

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("imagens/logo.png"),
                      Text(_fraseGerada,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 23,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          )),
                      RaisedButton(
                        onPressed: () {
                          _gerarFrase();
                        },
                        child: Text(
                          "Nova Frase",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        color: Colors.green,
                      )
                    ]))));
  }
}
