-- 1-Buscar nome e ano dos filmes
USE [Filmes];

SELECT [Nome], [Ano]
FROM [dbo].[Filmes];

-- 2-Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
USE [Filmes];

SELECT [Nome], [Ano],[Duracao]
FROM [dbo].[Filmes]
ORDER BY [Ano] ASC;

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
USE [Filmes];

SELECT [Nome], [Ano], [Duracao]
FROM [dbo].[Filmes]
WHERE [Nome] = 'De Volta para o Futuro';

-- 4 - Buscar os filmes lançados em 1997
USE [Filmes];

SELECT [Nome], [Ano], [Duracao]
FROM [dbo].[Filmes]
WHERE [Ano] = 1997;

-- 5 - Buscar os filmes lançados APÓS o ano 2000
USE [Filmes];

SELECT [Nome], [Ano], [Duracao]
FROM [dbo].[Filmes]
WHERE [Ano] > 2000;

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
USE [Filmes];

SELECT [Nome], [Ano], [Duracao]
FROM [dbo].[Filmes]
WHERE [Duracao] > 100 AND [Duracao] < 150
ORDER BY [Duracao] ASC;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
USE [Filmes];

SELECT [Ano], COUNT(*) AS [Quantidade]
FROM [dbo].[Filmes]
GROUP BY [Ano]
ORDER BY [Quantidade] DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
USE [Filmes];

SELECT [PrimeiroNome], [UltimoNome]
FROM [dbo].[Atores]
WHERE [Genero] = 'M';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
USE [Filmes];

SELECT PrimeiroNome, UltimoNome
FROM [dbo].[Atores]
WHERE Genero = 'F'
ORDER BY PrimeiroNome;

-- 10 - Buscar o nome do filme e o gênero
SELECT f.Nome AS Nome, g.Genero AS Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g ON g.Id = fg.IdGenero;


-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome AS FilmesNome, g.Genero AS FilmesGenero
FROM Filmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g ON g.Id = fg.IdGenero
WHERE g.Genero = 'Mistério';

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
  f.Nome AS Nome,
  a.PrimeiroNome,
  a.UltimoNome,
  ef.Papel
FROM
  Filmes f
JOIN
  ElencoFilme ef ON f.Id = ef.IdFilme
JOIN
  Atores a ON a.Id = ef.IdAtor;
