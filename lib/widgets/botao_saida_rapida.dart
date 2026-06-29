import 'dart:io'; // Necessário para fechar o app nativamente
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Alternativa para fechar no iOS/Android de forma segura

class BotaoSaidaRapida extends StatelessWidget {
  const BotaoSaidaRapida({super.key});

  // Função interna que executa a saída segura do aplicativo
  void _fecharAplicativo() {
    if (Platform.isAndroid) {
      SystemNavigator.pop(); // Fecha o app suavemente no Android
    } else if (Platform.isIOS) {
      exit(0); // Fecha o app no iOS (forçado, conforme diretrizes da Apple)
    } else {
      exit(0); // Garante o fechamento em outras plataformas
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _fecharAplicativo,
      backgroundColor: Colors.red[700], // Cor de alerta/destaque
      icon: const Icon(Icons.exit_to_app, color: Colors.white),
      label: const Text(
        'SAÍDA RÁPIDA',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      elevation: 6, // Sombra para dar aspecto de flutuação
    );
  }
}