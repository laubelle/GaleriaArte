1.	Consulta “geral”
Nossa primeira consulta foi feita pensando em responder a questão “Quais exposições tiveram mais ingressos vendidos? Quem as organizou?”. Para isso, a estruturamos da seguinte maneira:
-	Apresenta em tela uma análise geral de quais exposicoes da galeria tiveram mais sucesso, além de quem são seus respectivos organizadores.
-	Nossa métrica do sucesso, no caso, foi a quantidade de ingressos vendidos. Para apresentar tal informação, utilizamos a função COUNT, e designamos o nome “total_ingressos” para o resultado disso utilizando o AS.
-	Para complementar os dados relacionados às exposições, colocamos seus nomes e datas de inicio e fim. Todos dados adquiridos da tabela “Exposicao” e renomeados com a função AS, para facilitar a leitura.
-	Utilizamos um INNER JOIN para associar o ID do funcionário encontrado na tabela Exposicao com o ID presente na tabela Funcionario. Assim, podemos apresentar o nome do funcionário que organizou a exposição ao invés de seu ID.
-	Utilizamos o LEFT JOIN para associar os ingressos da tabela Ingresso às exposições que pertencem. Optamos pelo left join para que, mesmo no caso de uma inconsistencia onde uma exposição não tenha um ingresso vendido, essa exposição ainda apareça na tabela de resultado.
-	Nas nossas consultas, usamos o comando CONCAT pra juntar as strings de primeiro nome e  ultimo nome dos funcionários, visitantes e artistas, apenas para facilitar a leitura das tabelas.
-	Por fim, ordenamos o resultado pela ordem decrescente de ingressos vendidos. Assim, as exposições de maior sucesso aparecem no topo.


2.	Consulta sobre Visitantes
Nossa segunda consulta foi pensada para responder a questão “Quem foram os visitantes mais frequentes, que compraram mais ingressos? eles compraram telas?”. Para tal, a montamos da seguinte maneira:
-	Ela apresenta em tela o nome dos visitantes, a quantidade de ingressos comprados, e a quantidade de telas compradas. 
-	Primeiramente, assim como na consulta anterior, concatenamos o nome e sobrenome, dessa vez do visitante.
-	Para realizar a contagem dos ingressos e das telas vendidas, foi necessário utilizar subconsultas. Enquanto pensávamos em como estruturar essa consulta, nos deparamos com o problema de que, quando montávamos a tabela com o join e aplicávamos o COUNT, a contagem efetuada pelo sistema saía incorreta, pois por exemplo: Se um visitante tivesse comprado 2 telas e o ingresso para apenas uma exposição, esse ingresso aparecia em duas linhas da tabela e, por consequencia, era contado 2 vezes. A solução que encontramos ao pesquisar foi utilizar a função de COUNT nessas duas subconsultas. 
-	A primeira subconsulta que fizemos foi a contagem dos ingressos de cada visitante. Ela verifica quantos ingressos existem na tabela Ingresso que pertencem a cada visitante em especifico, e essa contagem recebe o nome de Ingressos_comprados na nossa consulta principal.
-	A segunda subconsulta que foi feita é a contagem das obras vendidas a cada visitante. Funciona de maneira similar à primeira, porém com base na tabela Venda_Obra, e retorna o resultado sob o nome de Telas_Compradas à consulta principal.
-	Por fim, ordenamos essa consulta decrescentemente pela quantidade de ingressos comprados e pela quantidade de obras compradas.

3.	Consulta de Antecedencia
A terceira consulta, apesar de mais simples, apresenta um dado que consideramos interessante: Quão antecipadamente os ingressos são comprados, em média?
-	Para calcular isso, utilizamos a função AVG para calcular a média do resultado da função DATEDIFF, que conta a diferença de dias entre a data da visita e a data da compra. Renomeamos como media_antecedencia para facilitar a compreensão.
-	Como a data da visita não é um campo obrigatório na tabela de ingressos, utilizamos o WHERE para nos certificar de que os dados sendo utilizados nessa consulta são os dos ingressos que possuem data de visita.

4.	Consulta das obras
Nessa consulta, decidimos verificar quais as obras que participaram de exposições na galeria mas não estão à venda.  Para tal, fizemos o seguinte:
-	Seguimos o mesmo padrão de nomeação usando o AS que temos feito em todas as consultas. Selecionamos nome, ano, tecnica e disponibilidade da tabela Obras.
-	Fizemos um INNER JOIN com a tabela Obra_Exposicao, para selecionar apenas as obras que participaram de exposicoes.
-	Por fim, utilizamos o WHERE para especificar que buscavamos as obras com disponibilidade ‘N’.

5.	Consulta da Técnica
Nessa consulta, decidimos selecionar todas as obras da galeria que possuem como técnica “óleo sobre tela”.
-	Seguimos o mesmo padrão nos nomes das colunas utilizando o AS para o nome, ano e técnica da obra, e concatenamos o nome do artista.
-	Utilizamos um INNER JOIN com a tabela Artista, para associar o nome do artista às suas respectivas obras através do ID
-	Usamos o WHERE para selecionar apenas as obras cuja técnica continha as palavras “óleo sobre tela”, seguidas ou antecedidas por qualquer outra palavra.

6.	Consulta da Idade
Nessa consulta, ordenamos todos os artistas presentes na galeria com base na idade de suas obras, e contamos quantas obras possuem na galeria.
-	Novamente, iniciamos concatenando o nome dos artistas
-	Utilizamos a função COUNT para contar quantas obras cada artista possui em nosso acervo, e nomeamos esse resultado como Total_Obras
-	Usamos a função MIN para verificar o ano da tela mais antiga de cada artista, e nomeamos isso Ano_Obra_Mais_Antiga
-	De maneira similar, utilizamos o MAX para verificar o ano da mas nova, e nomeamos isso Ano_Obra_Mais_Recente
-	Agrupamos por Artista, e ordenamos crescentemente pela tela mais antiga e pela tela mais recente.

