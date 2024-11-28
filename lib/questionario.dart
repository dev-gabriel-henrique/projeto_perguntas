import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada => perguntaSelecionada < perguntas.length;

  @override
  Widget build(BuildContext context) {
    final respostas = temPerguntaSelecionada ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>> : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resposta) {
          return Resposta(
            resposta['texto'].toString(),
            () {
              quandoResponder(int.parse(resposta['pontuacao'].toString()));
            },
          );
        })
      ],
    );
  }
}