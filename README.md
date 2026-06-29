# Desperte Mulher 

O **Desperte Mulher** é um aplicativo mobile voltado para o apoio, acolhimento e identificação de sinais de violência doméstica e familiar contra a mulher. 

Este repositório documenta a evolução e a recente **Refatoração do Módulo de Análise de Risco Relacional**, focando em boas práticas de engenharia de software (Clean Code), usabilidade (UX) e segurança.

---

## O que mudou? (Evolução do Módulo de Análise)

Antes da refatoração, o questionário de perguntas exibia todos os dados corridos em uma única tela rolável, o que causava fadiga cognitiva na usuária. Além disso, o código estava centralizado em um único arquivo monolítico.

### Principais Implementações:
* **Abordagem Focada (`PageView`):** Agora o questionário exibe apenas **uma pergunta por tela** com bloqueio de arraste manual, exigindo uma interação intencional e protegida.
* **Avanço Automatizado:** Ao selecionar uma alternativa, o app aplica um feedback visual na cor rosa e avança de página automaticamente após 300ms.
* **Barra de Progresso Dinâmica:** Foi adicionado um `LinearProgressIndicator` customizado com bordas arredondadas (`ClipRRect`) no topo, mostrando o andamento real do quiz (0% a 100%).
* **Identidade de Marca:** Inclusão fixa da logotipo oficial do projeto no cabeçalho das perguntas.

---

##  Arquitetura e Destrinchamento de Código

Para seguir os princípios de responsabilidade única e modularização, o módulo foi totalmente desacoplado. O código saiu de um arquivo monolítico e foi dividido em 5 componentes especializados dentro do diretório `lib/Screens/quiz/`:

```text
lib/Screens/quiz/
├── aba_analise_page.dart       # Orquestrador principal (Estados, PageView e lógica do cálculo)
├── pagina_pergunta_view.dart    # Template genérico e isolado para renderização dos enunciados
├── widget_opcao_card.dart       # Card customizado e reutilizável para as alternativas do quiz
├── tela_resultado_view.dart     # Tela final isolada com o gráfico e feedbacks de pontuação
└── botao_saida_rapida.dart      # Componente global de segurança (alocado em /widgets)
