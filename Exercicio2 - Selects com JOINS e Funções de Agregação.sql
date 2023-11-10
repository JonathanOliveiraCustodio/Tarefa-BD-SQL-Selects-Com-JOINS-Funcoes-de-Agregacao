USE locadora


Select * from DVD

Select * from Cliente
Select * from Locacao
Select * from Filme
Select * from Filme_Estrela
Select * from Estrela
/*
1) Consultar num_cadastro do cliente, nome do cliente, data_locacao (Formato
dd/mm/aaaa), Qtd_dias_alugado (total de dias que o filme ficou alugado), titulo do
filme, ano do filme da locação do cliente cujo nome inicia com Matilde
*/
SELECT
    cli.num_cadastro AS Num_Cadastro,
    cli.nome AS Nome_Cliente,
    CONVERT(VARCHAR(10), loc.data_locacao, 103) AS Data_Locacao,
    DATEDIFF(day, loc.data_locacao, loc.data_devolucao) AS Qtd_Dias_Alugado,
    fil.titulo AS Titulo_Filme,
    fil.ano AS Ano_Filme
FROM
    Cliente cli
INNER JOIN
    Locacao loc ON cli.num_cadastro = loc.num_cadastro
INNER JOIN
    DVD D ON loc.num_dvd = D.num
INNER JOIN
    Filme fil ON D.id_filme = fil.id
WHERE
    cli.nome LIKE 'Matilde%';


/*
2) Consultar nome da estrela, nome_real da estrela, título do filme dos filmes
cadastrados do ano de 2015
*/

SELECT
    est.nome AS Nome_Estrela,
    est.nome_real AS Nome_Real_Estrela,
    fil.titulo AS Titulo_Filme
FROM
    Filme fil
INNER JOIN
    Filme_Estrela fe ON fil.id = fe.id_filme
INNER JOIN
    Estrela est ON FE.id_estrela = est.id
WHERE
    fil.ano = 2015;


/*
3) Consultar título do filme, data_fabricação do dvd (formato dd/mm/aaaa), caso a
diferença do ano do filme com o ano atual seja maior que 6, deve aparecer a diferença
do ano com o ano atual concatenado com a palavra anos (Exemplo: 7 anos), caso
contrário só a diferença (Exemplo: 4).
*/
SELECT
    fil.titulo AS Titulo_Filme,
    CONVERT(VARCHAR(10), D.data_fabricacao, 103) AS Data_Fabricacao_DVD,
    CASE
        WHEN YEAR(GETDATE()) - fil.ano > 6 THEN
            CAST(YEAR(GETDATE()) - fil.ano AS VARCHAR(10)) + ' anos'
        ELSE
            CAST(YEAR(GETDATE()) - fil.ano AS VARCHAR(10))
    END AS Diferenca_Ano_Atual
FROM
    Filme fil
INNER JOIN
    DVD D ON fil.id = D.id_filme;