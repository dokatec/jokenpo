import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = const AssetImage("images/padrao.png");
  var mensagem = "Escolha uma opção abaixo";

  opcaoSelecionada(escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          imagemApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          imagemApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          imagemApp = const AssetImage("images/tesoura.png");
        });
        break;
    }
    //Validação do ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        mensagem = "Parabéns!!! Você ganhou :)";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        mensagem = "Você perdeu :)";
      });
    } else {
      setState(() {
        mensagem = "Empatamos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokepo"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(
              image: imagemApp,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                mensagem,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
