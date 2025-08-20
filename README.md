# Banco de Dados para Galeria de Arte

Trabalho de conclusão da disciplina de Banco de Dados do curso de Sistemas de Informação. Desenvolvemos um sistema para gerenciar uma galeria de arte, abordando desde o controle do acervo até a organização de exposições e vendas.

## Sobre o Projeto

O sistema modela uma galeria de arte que organiza exposições temáticas ao longo do ano. O banco de dados controla o acervo de obras, cadastro de artistas, organização de exposições, vendas e visitação do público.

A galeria funciona como um espaço cultural onde visitantes podem conhecer obras de arte e eventualmente adquiri-las. Cada exposição é curada por funcionários especializados e pode conter obras de diferentes artistas do acervo.

## Regras de Negócio

- Cada obra pertence a um único artista, mas artistas podem ter múltiplas obras no acervo
- Exposições são organizadas por curadores (funcionários) e podem incluir várias obras
- Uma obra pode participar de diferentes exposições ao longo do tempo
- O sistema classifica obras em três status:
  - **D**: Disponível para venda
  - **N**: Não comercializada (apenas exposição)
  - **I**: Indisponível (já vendida)
- Obras vendidas são retiradas do acervo e não podem mais integrar exposições
- Visitantes se cadastram ao adquirir ingressos e podem frequentar múltiplas exposições
- Todas as transações de venda são registradas com dados do comprador, data e valor

## Tecnologias

- MySQL como sistema de gerenciamento de banco de dados
- Modelagem através de diagramas entidade-relacionamento (conceitual e lógico)
- Scripts SQL para criação de estrutura e manipulação de dados

## Consultas Implementadas

O sistema inclui consultas para análise de diferentes aspectos do negócio:

- **Análise de popularidade**: Exposições com maior número de ingressos vendidos e seus respectivos curadores
- **Perfil de visitantes**: Frequência de visitas e volume de compras por visitante
- **Comportamento de compra**: Antecedência média na aquisição de ingressos
- **Gestão do acervo**: Identificação de obras em exposição que não estão disponíveis para venda
- **Catálogo por técnica**: Filtros específicos por materiais e técnicas (ex: óleo sobre tela)
- **Análise temporal**: Distribuição cronológica das obras por artista

*Para detalhamento técnico das consultas, consulte o arquivo `docs/detalhamentoConsultas.md`*

