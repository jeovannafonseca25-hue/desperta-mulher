import 'package:flutter/material.dart';

class TelaResultadoView extends StatelessWidget {
  final int porcentagemRisco;
  final VoidCallback aoReiniciar;

  const TelaResultadoView({
    super.key,
    required this.porcentagemRisco,
    required this.aoReiniciar,
  });

  String _obterMensagemAlerta(int porcentagem) {
    if (porcentagem <= 30) {
      return 'Risco Baixo/Inicial. Continue se informando e mantendo seus limites seguros em suas relações.';
    } else if (porcentagem <= 70) {
      return 'Risco Moderado. Sinais de comportamento controlador ou abusivo foram detectados. Converse com pessoas de confiança ou procure apoio emocional.';
    } else {
      return 'ALERTA DE RISCO ALTO! Há sinais explícitos de comportamento perigoso e violência psicológica/física. Busque ajuda especializada imediatamente (Ligue 180).';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color corRisco = porcentagemRisco <= 30
        ? Colors.green
        : (porcentagemRisco <= 70 ? Colors.orange : Colors.red.shade700);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 72),
          const SizedBox(height: 16),
          const Text(
            'Análise Concluída!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 32),

          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: porcentagemRisco / 100,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(corRisco),
                ),
              ),
              Text(
                '$porcentagemRisco%',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: corRisco),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Indicador de Risco Relacional',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),

          Card(
            color: corRisco.withOpacity(0.08),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: corRisco.withOpacity(0.3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _obterMensagemAlerta(porcentagemRisco),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: corRisco.withOpacity(0.95), height: 1.4, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 32),

          OutlinedButton.icon(
            onPressed: aoReiniciar,
            icon: const Icon(Icons.refresh, color: Colors.pink),
            label: const Text('Responder Novamente', style: TextStyle(color: Colors.pink)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.pink),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}