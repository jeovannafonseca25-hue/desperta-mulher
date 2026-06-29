import 'package:flutter/material.dart';

class PaginaPerguntaView extends StatelessWidget {
  final String enunciado;
  final List<Widget> opcoes;

  const PaginaPerguntaView({
    super.key,
    required this.enunciado,
    required this.opcoes,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            enunciado,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.black87,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 24),
          ...opcoes,
          const SizedBox(height: 80), // Espaço protetor para o botão de saída
        ],
      ),
    );
  }
}