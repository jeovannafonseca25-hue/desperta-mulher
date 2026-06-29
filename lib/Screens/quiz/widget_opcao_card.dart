import 'package:flutter/material.dart';

class WidgetOpcaoCard extends StatelessWidget {
  final String texto;
  final int valor;
  final int? grupoValor;
  final ValueChanged<int?> aoMudar;

  const WidgetOpcaoCard({
    super.key,
    required this.texto,
    required this.valor,
    required this.grupoValor,
    required this.aoMudar,
  });

  @override
  Widget build(BuildContext context) {
    final bool selecionado = grupoValor == valor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: selecionado ? Colors.pink.shade200 : Colors.transparent,
            width: 1.5,
          ),
        ),
        color: selecionado ? const Color(0xFFFFF0F6) : Colors.white,
        child: RadioListTile<int>(
          title: Text(
            texto,
            style: TextStyle(
              fontSize: 15,
              fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
              color: selecionado ? Colors.pink.shade900 : Colors.black87,
            ),
          ),
          value: valor,
          groupValue: grupoValor,
          onChanged: aoMudar,
          activeColor: Colors.pink,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),
    );
  }
}