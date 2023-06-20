-- Consulte apenas os nomes dos artistas que possuem 'SILVA' em qualquer qualquer lugar do nome  e que tenha idade superior a 25 e organize em ordem crescente de sobrenome.


SELECT DISTINCT nome, dt_nascimento FROM tb_artista
WHERE nome LIKE '%silva%' 
AND dt_nascimento <= 1998-04-06;


-- Consulte apenas o nome e idade dos artistas que possuem idade entre 18 e 35 anos ou que possuam o nome iniciado com a letra 'P' e terminado com a letra 'Y' e organize em ordem crescente de idade.

SELECT   dt_nascimento,nome FROM tb_artista
WHERE dt_nascimento 
BETWEEN  '1988-01-01' AND '2005-01-01'
ORDER BY nome like 'p%y';

-- correção

SELECT nome, dt_nascimento FROM tb_artista 
WHERE (dt_nascimento BETWEEN '1998-04-26' AND '2005-04-26')
OR nome like 'p%y'
ORDER BY dt_nascimento ASC;


-- FORMA BONITA 

SELECT DISTINCT nome, dt_nascimento FROM tb_artista 
WHERE ((dt_nascimento BETWEEN '1998-04-26' AND '2005-04-26')
OR nome like 'p%y') AND dt_nascimento <> '0000-00-00'
ORDER BY dt_nascimento ASC;





-- Consulte o titulo dos discos do artista 5 e no resultado mostre o titulo apenas daqueles que tiverem de 20 minutos para cima e organize em ordem decrescente de minutos.

SELECT titulo, id_artista,id FROM tb_disco
WHERE id_artista = 5
ORDER BY duracao > '00:20:00' DESC;

-- CORREÇÃO

SELECT titulo, duracao FROM tb_disco
WHERE id_artista = 5 AND duracao <= '00:20:00'
ORDER BY duracao DESC;


SELECT * FROM tb_disco;


-- Consulte o titulo e ano de lançamento de todos os discos exceto os que estão entre 1998 e 2006 e organize por ano


SELECT DISTINCT titulo, ano_lancamento FROM tb_disco -- acertei
WHERE ano_lancamento NOT BETWEEN 1998 AND 2006      
ORDER BY ano_lancamento ASC;
 
 
 
 
 
 
 -- Consulte o nome  dos artistas que tenham o nome iniciado com 'C' e terminado com 'A',   organize por ordem alfabética de nome.
 
 SELECT DISTINCT nome FROM tb_artista
 WHERE nome LIKE 'C%A'
 ORDER BY nome ASC
 ;
 
 -- Consulte o nome e minutos de cada disco exceto dos artistas 3 e 7 e mostre no resultado apenas aqueles que possuem o tempo entre 35 e 75 minutos

SELECT DISTINCT duracao, titulo, id_artista FROM TB_DISCO -- assim tbm ta certo 
WHERE duracao BETWEEN  '00:35:00' AND '01:10:00'
ORDER BY id_artista <> 3 AND id_artista <> 7 
LIMIT 1000
;

-- correção 

SELECT DISTINCT titulo, duracao FROM tb_disco 
WHERE (id_artista NOT IN (5,7)) 
AND (duracao BETWEEN '00:35:00' AND '01:15:00');


-- Consulte o ano de lançamento dos discos cadastrados mostre quantos discos cada ano possui, porém mostre apenas dos anos 2010 a 2020

SELECT titulo, ano_lancamento  FROM tb_disco
WHERE ano_lancamento BETWEEN 2010 AND 2020
ORDER BY count(2010);

-- CORREÇÃO

SELECT ano_lancamento, COUNT(ano_lancamento) AS quantidade 
FROM tb_disco 
WHERE ano_lancamento BETWEEN 2010 AND 2020
GROUP BY ano_lancamento;

-- Busque a data de nascimento mais antiga. (certo

SELECT MIN(dt_nascimento) FROM tb_artista
WHERE NOT dt_nascimento = 0000-00-00;


-- Busque a media de duração dos discos

SELECT avg(duracao) FROM tb_disco;


-- Busque a menor musica

SELECT MIN(duracao), nome FROM tb_musica;

 





