
--                                              JOIN

SELECT DISTINCT
     d.titulo AS disco, -- o D.TItULO serve de ancora da coluna disco
	 d.duracao AS disco_duracao,
     ge.nome AS genero
FROM tb_disco AS d
INNER JOIN tb_genero AS ge-- O INNER join serve pra puxar dois dados iguais de duas colunas diferente
ON   d.id_genero = ge.id -- o ON serve pra filtrar o JOIN
ORDER BY disco ASC;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT             -- jeito meio errado de se fazer mas q mostra o mesmo  resutado 
     d.titulo,
     d.duracao,
     ge.nome
FROM tb_disco AS d, tb_genero AS ge
WHERE (d.id_genero = ge.id) AND d.id =1000;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT DISTINCT
     d.titulo AS disco, -- o D.TItULO serve de ancora da coluna disco
	 d.duracao AS disco_duracao,
     ge.nome AS genero
FROM tb_disco AS d
LEFT JOIN tb_genero AS ge-- o LEFT da prioridade para oq estiver na frente do FROM e antes do JOIN
ON   d.id_genero = ge.id -- o ON serve pra filtrar o JOIN
ORDER BY disco ASC;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT DISTINCT
     d.titulo AS disco, -- o D.TItULO serve de ancora da coluna disco
	 d.duracao AS disco_duracao,
     ge.nome AS genero
FROM tb_disco AS d
RIGHT JOIN tb_genero AS ge-- o RIGHT da prioridade para oq estiver na  frente do JOIN e antes do FROM
ON   d.id_genero = ge.id -- o ON serve pra filtrar o JOIN
ORDER BY disco ASC;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



SELECT DISTINCT
     d.titulo AS disco, -- o D.TItULO serve de ancora da coluna disco
	 d.duracao AS disco_duracao,
     ge.nome AS genero,
	 gr.nome AS gravadora,
     a.nome AS artista
FROM tb_disco AS d
INNER JOIN tb_genero AS ge-- 
ON    d.id_genero = ge.id -- o ON serve pra filtrar o JOIN
INNER JOIN tb_gravadora AS gr 
ON    d.id_gravadora = gr.id 
INNER JOIN tb_artista AS a 
on d.id_artista = a.id;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW vw_ponto_eletronico AS
SELECT 
     f.id as id_funcionario,
	 f.nome as funcionario, 
     h.horario
FROM tb_funcionario AS f
INNER JOIN tb_horario AS h
ON f.id = h.id_funcionario ; 












































































