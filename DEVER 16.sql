-- Mostre o nome do disco e da gravadora porem mostre somente aqueles que estão relacionados

SELECT d.titulo, g.nome
FROM tb_disco AS d
INNER JOIN tb_genero AS g
ON d.id = g.id;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
     d.titulo disco,
     g.nome gravadora
FROM tb_disco d 
INNER JOIN tb_gravadora g 
    ON d.id_grvadora = g.id;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-- Mostre o nome de todos os discos e quando disponível o nome das gravadoras de cada um


USE db_discoteca2;

SELECT  
	  d.id,
      d.titulo AS disco, 
      gra.nome AS gravadora, 
      ge.nome AS genero
FROM  tb_disco AS d
INNER JOIN tb_gravadora AS gra
ON  gra.id = d.id
INNER JOIN tb_genero AS ge
ON id_genero = d.id;

-- CORREÇÃO 


SELECT
     d.titulo disco,
     g.nome gravadora
FROM tb_disco d 
RIGHT JOIN tb_gravadora g 
    ON d.id_gravadora = g.id;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Pode ser usado left assim tbm 

SELECT
     d.titulo disco,
     g.nome gravadora
FROM tb_gravadora g 
LEFT JOIN tb_disco d 
    ON d.id_gravadora = g.id;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre o nome do disco 32 e todas as musicas desse disco.
SELECT d.titulo , 
       d.id, 
       m.nome  as disco
FROM tb_disco AS d
INNER JOIN tb_musica AS m
ON d.id = 32; 

-- CORREÇÃO 


SELECT 
       d.id, 
       m.nome  as disco
FROM tb_disco AS d
INNER JOIN tb_musica AS m
ON d.id = 31;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Consulte o nome do disco 80252 mostrando todas as suas musicas e mostre também o nome da gravadora

SELECT 
      d.titulo AS disco, 
      d.id, 
      m.nome AS musicas, 
      g.nome AS gravadora
FROM tb_disco AS d
INNER JOIN tb_musica AS m
INNER JOIN tb_gravadora AS g
ON d.id = 80252;



-- CORREÇÃO 

SELECT DISTINCT 
          d.titulo ,
          d.id,
          m.nome,
          gr.nome
FROM tb_disco AS d
INNER JOIN tb_gravadora AS gr 
ON tb_gravadora = tb_disco
INNER JOIN tb_musica AS m
ON d.id = m.id_disco = gr.id 
WHERE d.id  = 80252 ;






--  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------0------------------

-- Mostre o nome de todas os discos e todas as gravadoras e dos discos mostre também o ano de lançamento.


SELECT 
d.titulo 'titulo disco' ,
d.ano_lancamento 'ano lançamento',
gra.nome ' gravadora'
FROM tb_disco AS d
LEFT JOIN tb_gravadora AS gra
ON gra.id = d.id_gravadora 

UNION 

SELECT 
d.titulo 'titulo disco' ,
d.ano_lancamento 'ano lançamento',
gra.nome ' gravadora'
FROM tb_disco AS d
RIGHT JOIN tb_gravadora AS gra                
ON gra.id =  d.id_gravadora;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  Mostre quantas musicas cada disco possui. E deseja-se saber também o nome do disco.

SELECT 
      m.id AS musicas, 
      d.titulo AS discos
FROM tb_musica AS m
INNER JOIN tb_disco AS d
WHERE m.id GROUP BY d.titulo; 


-- CORREÇÃO 




SELECT d.titulo, COUNT(m.id_disco) AS quantidade 
FROM tb_musica m 
    RIGHT JOIN tb_disco d
	ON m.id_disco = d.id
GROUP BY m.id_disco;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- mostre o nome das musicas e o nome do disco dessas musicas


SELECT 
      d.titulo AS disco,
      m.nome 
FROM  tb_musica AS m
INNER JOIN tb_disco AS d;



-- CORREÇÃO 


   
   SELECT DISTINCT m.nome AS nome_musica, d.titulo  as nome_disco
   FROM tb_musica AS m 
   LEFT JOIN tb_disco as d
       
   ORDER BY  m.nome ASC;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- mostre o nome dos discos e o nome dos artista ordenado por artista, deseja-se saber todos os artistas e todos os discos

SELECT DISTINCT d.titulo, a.nome FROM tb_artista AS a
RIGHT JOIN tb_disco AS d 
ON
UNION
SELECT DISTINCT d.titulo, a.nome FROM tb_artista AS a
LEFT JOIN tb_disco AS d;

-- CORREÇÃO 

SELECT 
      d.titulo AS disco,
      a.nome AS artista
FROM tb_disco AS d
LEFT JOIN tb_artista AS a
      ON d.id_artista = a.id
UNION 
SELECT 
      d.titulo AS disco,
      a.nome AS artista
FROM tb_disco AS d
RIGHT JOIN tb_artista AS a
      ON d.id_artista = a.id
ORDER BY artista;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- mostre o nome do disco, da gravadora e do artista ordenado por gravadora (pelo professor)

SELECT 
    d.titulo AS titulo,
    a.nome AS artista,
    g.nome AS gravadora
FROM 
    tb_disco AS d 
LEFT  JOIN
    tb_gravadora AS g 
ON g.id = d.id_artista
LEFT JOIN  
	tb_artista as a
ON d.id_artista = a.id 
ORDER BY gravadora;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- mostre nome do disco, ano de lancamento, tempo, nome da gravadora e nome  completo do artista, junto a sua idade, ordenado por artista (pelo professor)

SELECT  
     d.titulo disco,
     d.ano_lancamento, 
	d.duracao,  
    g.nome gravadora,    
    a.nome artista,
    a.dt_nascimento
FROM
    tb_disco d
INNER JOIN tb_gravadora g 
    ON g.id = d.id_gravadora 
INNER JOIN tb_artista a 
		ON a.id = d.id_artista;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  mostre o nome do disco e todos os dados da musica, exceto fk, porem somente dos   discos 1, 10, 100, 1000, 10000, 100000  ordenado por disco (pelo professor)
SELECT 
    d.titulo disco,
    m.nome musica,
    m.duracao musica_duracao,
    m.id codigo_musica
FROM
    tb_disco d
        INNER JOIN
    tb_musica m ON d.id = m.id_disco
WHERE
    d.id IN (1 , 10, 100, 1000, 10000, 100000);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- mostre nome da gravadora, todos os dados do artista, exceto fk, todos os dados do disco exceto fk, e todos os dados das musicas relacionados, ordenado por artista porem mostre apenas dos disco de 1000 a 15000. (pelo professor)

SELECT 
     d.id, d.titulo disco, d.ano_lancamento, d.duracao, 
     g.id, g.nome gravadora, 
     a.id, a.nome artista, a.dt_nascimento nascimento_artista 
FROM tb_disco d 
INNER JOIN tb_gravadora g 
     ON g.id = d.id_gravadora 
INNER JOIN tb_artista a 
     ON  a.id = d.id_artista 
WHERE d.id BETWEEN 1000 AND 15000
ORDER BY artista ASC;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre quantas musicas estão cadastradas. (pelo professor)

SELECT COUNT(1) FROM tb_musica;
SELECT COUNT(id) FROM tb_musica;
SELECT COUNT(*) FROM tb_musica;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre a maior musica.
SELECT MAX(m.duracao), m.nome  from tb_musica as m;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mostre a menor disco.

SELECT MIN(d.duracao), d.titulo FROM tb_disco d;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT MIN(d.duracao), d.titulo from tb_disco as d;





-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre quantos discos cada gravadora possui em ordem decrescente deseja-se saber o nome da gravadora
SELECT g.id, g.nome FROM tb_gravadora AS g
ORDER BY g.nome DESC;

-- CORREÇÃO

SELECT 
      g.nome,
      COUNT(d.id_gravadora) AS quantidade  
FROM tb_disco d
RIGHT JOIN tb_gravadora g
ON g.id = d.id_gravadora
GROUP BY id_gravadora
ORDER BY quantidade DESC;

-- Mostre quantos discos cada gênero possui em ordem decrescente deseja-se saber o nome do gênero (pelo professor)

SELECT 
      g.nome,
      COUNT(d.id_genero) AS quantidade  
FROM tb_disco d
RIGHT JOIN tb_genero g
ON g.id = d.id_genero 
GROUP BY id_genero 
ORDER BY quantidade DESC;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre  o tempo total de cada disco, porém mostre apenas os que possuem tempo superior a 1 hora, ordenado de forma decrescente (faça usando a tabela musica). (pelo professor)

SELECT 
      d.titulo,
      SUM(m.duracao) duracao_total
FROM tb_musica m
INNER JOIN tb_disco d 
ON d.id = m.id_disco 
GROUP BY m.id_disco
HAVING duracao_total > 6000;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre quantos discos cada gravadora possui, mostre apenas as que possuem mais que 500 discos e que o ano de lançamento seja de 2000 pra frente ordenado de forma crescente de ano, deseja-se saber o nome da gravador (pelo professor)


SELECT 
      g.nome,
      COUNT(d.id_gravadora) AS quantidade  
FROM tb_disco d
RIGHT JOIN tb_gravadora g
ON g.id = d.id_gravadora
WHERE d.ano_lancamento >= 2000
GROUP BY id_gravadora
HAVING quantidade > 500 
ORDER BY quantidade DESC;




-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Mostre quantos discos cada artista possui filtrando apenas os que tem mais que 700 e tenha e não estejam presentes os anos 1985, 1998 e 2002. (pelo professor)

SELECT 
     a.nome artista, 
     COUNT(d.id_artista) quantidade 
FROM tb_disco d
LEFT JOIN tb_artista a
ON a.id = d.id_artista 
WHERE d.ano_lancamento NOT IN (1985, 1998, 2002)
GROUP BY d.id_artista 
HAVING quantidade > 100;





















