
DELIMITER $$

CREATE FUNCTION fn_multiplica2 (numero1 INT, numero2 INT)
RETURNS INT
READS SQL DATA
  BEGIN 
  DECLARE multiplica INT;
  set multiplica = numero1 * numero2;
  RETURN multiplica; 
  END $$
    DELIMITER ;
  DELIMITER $$
  
  CREATE FUNCTION fn_divisao3 (numero1 INT, numero2 INT)
RETURNS FLOAT
READS SQL DATA
  BEGIN 
  DECLARE divisao INT;
  set divisao = numero1 / numero2;
  RETURN divisao; 
  END $$
  
  
  DELIMITER ;
  
  
  DELIMITER $$
  CREATE FUNCTION IF NOT EXISTS fn_info_artista (id_artista INT)
  RETURNS VARCHAR(255)
  READS SQL DATA
      BEGIN 
         DECLARE registro VARCHAR(255);
         SET registro = (SELECT 
                               CONCAT(' codigo artista ', id_artista,
                               ' ola me chamo ', nome,
                               ' nasci em ', dt_nascimento)
						 FROM tb_artista
                         WHERE id = id_artista);
RETURN registro;
END $$
  DELIMITER ;
  
DROP FUNCTION fn_info_artista;





