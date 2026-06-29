import 'package:flutter/material.dart';
import 'Screens/aba_analise_page.dart'; // Importa a sua nova tela

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AbaAnalisePage(), // Força o app a abrir direto na sua tela
    ),
  );
}
