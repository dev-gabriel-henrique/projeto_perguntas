import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaAPP());

class PerguntaAPP extends StatefulWidget {
  const PerguntaAPP({super.key});

  @override
  State<PerguntaAPP> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;

  static const List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    debugPrint('Pergunta ${_perguntaSelecionada + 1} selecionada');
  }

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    final respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]['respostas'] as List<String> : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Colors.blueAccent,
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'] as String),
                  ...respostas.map((resposta) => Resposta(resposta, _responder)),
                ],
              )
            : const Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
