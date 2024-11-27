import 'package:flutter/material.dart';

main() => runApp(PerguntaAPP());

class PerguntaAppState extends State<PerguntaAPP> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              onPressed: responder,
              child: Text('Resposta 1'),
            ),
            ElevatedButton(
              child: const Text('Resposta 2'),
              onPressed: () {
                print('Resposta 2 foi selecionada!');
              },
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: () => print('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  const PerguntaAPP({super.key});

  @override
  State<PerguntaAPP> createState() {
    return PerguntaAppState();
  }
}
