USE db_familia;


SELECT 
      id, nome, 
     CASE
       WHEN id_mae IS NULL THEN 'mãe n informada'
       ELSE id_mae
     END AS id_mãe,
	CASE
      WHEN id_pai IS NULL THEN 'pai não informado'
      ELSE id_pai
      END AS id_pai
FROM tb_filho;
 
#Como ver se os filhos n tem pai ou mãe sem mostrar os valores nulos
SELECT
      f.id,
      f.nome,
	CASE WHEN p.nome IS NULL THEN 'n/a'
      ELSE p.nome
	END AS pai,
      CASE WHEN m.nome IS NULL THEN 'n/a'
      ELSE m.nome
    END AS mae
FROM tb_filho as f
    LEFT JOIN tb_pai as p
        ON f.id_pai = p.id
    LEFT JOIN tb_mae as m
        ON f.id_mae = f.id;


DELIMITER //
CREATE PROCEDURE sp_insert_filho(
     nome_filho VARCHAR(255),
     cod_mae INT,
     cod_pai INT)
BEGIN  
     IF NOT EXISTS (SELECT id FROM tb_mae WHERE id = cod_mae) THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'codigo de nãe invalido';
	ELSE IF
		NOT EXISTS (SELECT id FROM tb_pai WHERE id = cod_pai) THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'codigo de nãe invalido';
	ELSE IF
        (nome_filho IS NULL) OR (nome_filho)
        
 delimiter ;       
        
        
        
        
        
        



