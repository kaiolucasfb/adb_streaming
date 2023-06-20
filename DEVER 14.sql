	
	-- Coloque em um arquivo do bloco de notas apenas os códigos para realizar as seguintes consultas.


-- mostre o nome das gravadores em ordem alfabética
    SELECT nome FROM tb_gravadora ORDER BY nome ASC; 
    
  
-- Mostre os disco que possuem mais que uma hora de musicas em ordem do maior para o menor
	
SELECT  titulo, duracao -- 
FROM tb_disco
WHERE duracao >= '01:00:01' 
order by duracao DESC 
LIMIT 10000;                    
  
  -- Mostre as musicas todas as musicas com tamanho iguais ou menor que 3.0 minutos
  
  SELECT DISTINCT  nome, duracao 
FROM tb_musica
WHERE duracao <= '00:03:00'
ORDER BY nome 
LIMIT 10000;   
  
  -- mostre os discos que são do ano 1996, 1999, 2015 em ordem crescente

  
  SELECT DISTINCT  titulo, ano_lancamento  
FROM tb_disco
WHERE ano_lancamento <= '1996' '1999' '2015' 
ORDER BY ano_lancamento DESC 
LIMIT 10000;   

-- CORREÇÃO

 -- SELECT DISTINCT  titulo, ano_lancamento  
-- FROM tb_disco
-- WHERE ano_lancamento IN ('1996', '1999', '2015') 
-- ORDER BY ano_lancamento ASC
-- LIMIT 10000;


-- mostre o nome e ano dos disco do ano 2000 ate 2022


SELECT   titulo, ano_lancamento -- dever 5
FROM tb_disco 
WHERE ano_lancamento BETWEEN '2000' AND '2022'
ORDER BY titulo 
LIMIT 10000;   




-- mostre nome e data de nascimento dos artistas de 2003 pra frente




SELECT   nome, dt_nascimento -- dever 6
FROM tb_artista 
WHERE dt_nascimento > '2003-01-01' 
ORDER BY  dt_nascimento ASC 
LIMIT 1000;   

-- CORREÇÃO
-- SELECT   nome, dt_nascimento -- dever 6
-- FROM tb_artista 
-- WHERE dt_nascimento >= '2003-01-01' 
-- LIMIT 1000;   

-- mostre todas as gravadoras que o ID seja diferente de 6 em ordem decrescente.


SELECT DISTINCT  nome, id
FROM tb_gravadora 
WHERE id <> 6  -- o NOT IN (6) funcionaria aqui tbm pois apenas negaria o id 6 e puxaria os outros  ids
ORDER BY nome DESC
LIMIT 10000;   


-- Mostre quais são as datas de nascimento dos artistas cadastradas no banco sem repetilas.
SELECT DISTINCT  nome, dt_nascimento 
FROM tb_artista
 WHERE dt_nascimento -- aqui o WHERE ta sendo inutil pois o select ja ta puxando a dt_nascimento
LIMIT 10000;   


-- Mostre o nome e tempo das musicas que possuem o tempo menor ou igual 2, ou maior ou igual 4



SELECT DISTINCT  nome, duracao 
FROM tb_musica
where duracao >= '00:02:00' OR duracao <= '00:04:00';

-- Mostre o titulo e ano dos discos entre 1997 e 2008

SELECT titulo, ano_lancamento
FROM tb_disco
WHERE  (ano_lancamento >= '1997' AND ano_lancamento <='2008');  




-- Mostre o nome das gravadoras com a letra 'd' em qualquer parte do nome.
 SELECT DISTINCT  nome, id
FROM tb_gravadora
WHERE nome LIKE '%d%'; 






-- Mostre o nome das musicas do disco 23
SELECT  nome 
FROM tb_musica
WHERE id_disco = 23;



-- Mostre os discos que tenham a letra 'S' no final
SELECT titulo
FROM tb_disco 
WHERE titulo LIKE '%S'
LIMIT 1000;   

SELECT * FROM tb_disco;




-- Mostre em ordem decrescente o nome dos artistas que tem a segunda letra 'E' e terminem com a letra 'O'
SELECT DISTINCT nome 
FROM tb_artista
WHERE nome LIKE '_E%' AND nome LIKE '%o' -- aqui funcionaria '_e%o'
ORDER BY nome DESC
LIMIT 10000;




-- Indique o nome crescente , mas apenas das musicas que possuam menos de 3.0 minutos de duração
SELECT DISTINCT  nome, duracao 
FROM tb_musica
WHERE duracao  < '00:03:00'
ORDER BY nome ASC
LIMIT 10000;




-- Indique os discos que iniciam com a letra A ou terminem com  letra a sendo a penultima letra.


SELECT DISTINCT  titulo, duracao 
FROM tb_disco
WHERE titulo LIKE 'A%' OR titulo LIKE '%A_'
LIMIT 10000;




-- Mostre o nome dos artistas que comecem com a letra C e que tenham idade superior a 23.
SELECT DISTINCT  nome, dt_nascimento
FROM tb_artista
WHERE (nome LIKE 'c%' AND dt_nascimento <= '2000-01-01')
AND dt_nascimento <> '0000-00-00'
LIMIT 10000;



-- Mostre o nome das musicas, exceto as são são dos discos 6, 12 e 34.
  SELECT DISTINCT  nome, id_disco
FROM tb_musica
WHERE id NOT IN (6, 12, 34)
LIMIT 10000;