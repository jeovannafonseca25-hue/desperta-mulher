import 'package:flutter/material.dart';
import '../widgets/botao_saida_rapida.dart'; // Sobe uma pasta e entra em widgets

// Como aba_analise_page está fora da pasta quiz, ele precisa entrar nela:
import 'quiz/widget_opcao_card.dart';
import 'quiz/pagina_pergunta_view.dart';
import 'quiz/tela_resultado_view.dart';

class AbaAnalisePage extends StatefulWidget {
  const AbaAnalisePage({super.key});

  @override
  State<AbaAnalisePage> createState() => _AbaAnalisePageState();
}

class _AbaAnalisePageState extends State<AbaAnalisePage> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;
  final int _totalPerguntas = 5;

  int? _p1, _p2, _p3, _p4, _p5;

  void _proximaPergunta() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  int _calcularPorcentagemRisco() {
    int totalPontos = (_p1 ?? 0) + (_p2 ?? 0) + (_p3 ?? 0) + (_p4 ?? 0) + (_p5 ?? 0);
    return ((totalPontos / (_totalPerguntas * 2)) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    bool estaNaTelaFinal = _paginaAtual == _totalPerguntas;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF4F8),
      body: SafeArea(
        child: Column(
          children: [
            if (!estaNaTelaFinal)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shield_outlined, color: Colors.pink, size: 28),
                        const SizedBox(width: 8),
                        Text(
                          'Pergunta ${_paginaAtual + 1} de $_totalPerguntas',
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black54),
                        ),
                      ],
                    ),
                    Text(
                      '${((_paginaAtual) / _totalPerguntas * 100).toInt()}%',
                      style: TextStyle(color: Colors.pink.shade300, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (pagina) => setState(() => _paginaAtual = pagina),
                children: [
                  // P1
                  PaginaPerguntaView(
                    enunciado: 'O seu parceiro tenta controlar o que você veste, com quem conversa ou para onde você vai?',
                    opcoes: [
                      WidgetOpcaoCard(texto: 'Não, ele respeita minhas decisões', valor: 0, grupoValor: _p1, aoMudar: (v) { setState(() => _p1 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Às vezes ele demonstra ciúmes excessivos e critica minhas roupas', valor: 1, grupoValor: _p1, aoMudar: (v) { setState(() => _p1 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Sim, ele me proíbe de ver pessoas ou sair sozinha', valor: 2, grupoValor: _p1, aoMudar: (v) { setState(() => _p1 = v); _proximaPergunta(); }),
                    ],
                  ),
                  // P2
                  PaginaPerguntaView(
                    enunciado: 'Você é frequentemente criticada, humilhada ou insultada por ele?',
                    opcoes: [
                      WidgetOpcaoCard(texto: 'Nunca passei por isso', valor: 0, grupoValor: _p2, aoMudar: (v) { setState(() => _p2 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Raramente, mas já aconteceu em momentos de brigas', valor: 1, grupoValor: _p2, aoMudar: (v) { setState(() => _p2 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Sim, de forma constante, me fazendo sentir culpada', valor: 2, grupoValor: _p2, aoMudar: (v) { setState(() => _p2 = v); _proximaPergunta(); }),
                    ],
                  ),
                  // P3
                  PaginaPerguntaView(
                    enunciado: 'Você já sentiu medo das reações, do tom de voz ou do comportamento do seu parceiro?',
                    opcoes: [
                      WidgetOpcaoCard(texto: 'Não, me sinto totalmente segura ao lado dele', valor: 0, grupoValor: _p3, aoMudar: (v) { setState(() => _p3 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Já senti receio ou desconforto em situações isoladas', valor: 1, grupoValor: _p3, aoMudar: (v) { setState(() => _p3 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Sim, mudo meus comportamentos para evitar que ele estoure', valor: 2, grupoValor: _p3, aoMudar: (v) { setState(() => _p3 = v); _proximaPergunta(); }),
                    ],
                  ),
                  // P4
                  PaginaPerguntaView(
                    enunciado: 'Ele tenta afastar você de seus familiares, amigos ou do trabalho?',
                    opcoes: [
                      WidgetOpcaoCard(texto: 'Não, ele me incentiva e convive bem com todos', valor: 0, grupoValor: _p4, aoMudar: (v) { setState(() => _p4 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Ele não gosta muito de alguns familiares e evita que eu os veja', valor: 1, grupoValor: _p4, aoMudar: (v) { setState(() => _p4 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Sim, estou praticamente isolada por causa dele', valor: 2, grupoValor: _p4, aoMudar: (v) { setState(() => _p4 = v); _proximaPergunta(); }),
                    ],
                  ),
                  // P5
                  PaginaPerguntaView(
                    enunciado: 'Ele já quebrou objetos seus, te empurrou ou cometeu qualquer agressão física?',
                    opcoes: [
                      WidgetOpcaoCard(texto: 'Nunca ocorreu nada parecido', valor: 0, grupoValor: _p5, aoMudar: (v) { setState(() => _p5 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Já quebrou objetos agressivamente durante discussões', valor: 1, grupoValor: _p5, aoMudar: (v) { setState(() => _p5 = v); _proximaPergunta(); }),
                      WidgetOpcaoCard(texto: 'Sim, já sofri agressões físicas diretas ou ameaças', valor: 2, grupoValor: _p5, aoMudar: (v) { setState(() => _p5 = v); _proximaPergunta(); }),
                    ],
                  ),
                  // TELA FINAL
                  TelaResultadoView(
                    porcentagemRisco: _calcularPorcentagemRisco(),
                    aoReiniciar: () {
                      setState(() {
                        _p1 = _p2 = _p3 = _p4 = _p5 = null;
                        _pageController.jumpToPage(0);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const BotaoSaidaRapida(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}