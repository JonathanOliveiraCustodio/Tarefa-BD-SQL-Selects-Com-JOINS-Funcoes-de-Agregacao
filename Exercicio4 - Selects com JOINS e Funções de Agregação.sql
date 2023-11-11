USE locadora
GO


Select * from Cliente
Select * from Locacao
Select * from Filme
Select * from DVD
Select * from Filme_Estrela
Select * from Estrela

/*1) Consultar, num_cadastro do cliente, nome do cliente, titulo do filme, data_fabricação
do dvd, valor da locação, dos dvds que tem a maior data de fabricação dentre todos os
cadastrados.
*/
SELECT
    cli.num_cadastro,
    cli.nome,
    fil.titulo,
    dvd.data_fabricacao,
    loc.valor
FROM
    Cliente cli
INNER JOIN
    Locacao loc ON cli.num_cadastro = loc.num_cadastro
INNER JOIN
    DVD dvd ON loc.num_dvd = dvd.num
INNER JOIN
    Filme fil ON dvd.id_filme = fil.id
WHERE
    dvd.data_fabricacao = (SELECT MAX(data_fabricacao) FROM DVD);

/*2) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a quantidade de DVD ́é alugados por cliente (Chamar essa
coluna de qtd), por data de locação
*/

SELECT
    C.num_cadastro,
    C.nome,
	CONVERT(CHAR(10), loc.data_locacao, 103) AS data_locacao,
    COUNT(loc.num_dvd) AS qtd
FROM
    Cliente C
INNER JOIN
    Locacao loc ON C.num_cadastro = loc.num_cadastro
GROUP BY
    C.num_cadastro,
    C.nome,
    loc.data_locacao
ORDER BY loc.data_locacao ASC;

/*3) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a valor total de todos os dvd ́s alugados (Chamar essa
coluna de valor_total), por data de locação
*/

SELECT
    C.num_cadastro,
    C.nome,
	CONVERT(CHAR(10), loc.data_locacao, 103) AS data_locacao,
    SUM(loc.valor) AS Qtd_Total
FROM
    Cliente C
INNER JOIN
    Locacao loc ON C.num_cadastro = loc.num_cadastro
GROUP BY
    C.num_cadastro,
    C.nome,
    loc.data_locacao
ORDER BY loc.data_locacao ASC;



/*4) Consultar Consultar, num_cadastro do cliente, nome do cliente, Endereço
concatenado de logradouro e numero como Endereco, data de locação (Formato
DD/MM/AAAA) dos clientes que alugaram mais de 2 filmes simultaneamente
*/

SELECT DISTINCT
    cli.num_cadastro,
		cli.nome,
		cli.logradouro + ', ' + CAST(num AS VARCHAR(5)) 
			+ ' - CEP: ' + SUBSTRING(cli.cep,1,5) + '-' + SUBSTRING(cli.cep,6,3) AS end_compl,	
    CONVERT(CHAR(10), loc.data_locacao, 103) AS data_locacao
FROM
    Cliente cli
INNER JOIN
    Locacao loc ON cli.num_cadastro = loc.num_cadastro
WHERE
    loc.num_cadastro IN (
        SELECT num_cadastro
        FROM Locacao
        GROUP BY num_cadastro
        HAVING COUNT(num_dvd) > 2
    );