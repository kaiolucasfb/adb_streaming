# TRIGGER SO E USADO COM (INSERT)/(DELETE)/(UPDATE)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table tb_historico(id INT primary key auto_increment,
                           usuario varchar (255) not null,
                           acao CHAR(6) not null,
                           data datetime not null 
  )auto_increment = 1;
  
alter table tb_historico add column `table` VARCHAR (255) not null after acao;

DELIMITER //


create trigger tr_insert_pai 
before insert 
on tb_pai
for each row 
begin 
    insert into tb_historico
           (usuario, acao, `table`, data)
    values 
           (current_user(),'insert', 'tb_pai', now());
	
	
end //

DELIMITER ;
delete from tb_pai where id = 1000;


drop trigger tr_insert_pai;

SELECT * FROM tb_historico;



DELIMITER //


create trigger tr_update_pai 
before update  
on tb_pai
for each row 
begin 
    insert into  tb_historico
           (usuario, acao, `table`, data, nome_antigo, novo_nome)
    values 
           (current_user(),'UPDATE','tb_pai', now(), old.nome, new.nome);
end //

DELIMITER ;

select * from tb_historico;
select * from tb_pai;
update tb_pai set nome = 'updaynildo' WHERE id;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																				#CRIANDO


create database if not exists db_loja
collate utf8mb4_general_ci
char set utf8mb4;
 drop database db_loja;
 use db_loja;
 CREATE TABLE IF NOT EXISTS tb_produto (id INT PRIMARY KEY AUTO_INCREMENT, 
							            nome VARCHAR(255), 
                                        preco FLOAT, 
                                        quantidade INT);
		DROP table tb_produto;
        
CREATE TABLE IF NOT EXISTS tb_venda ( id INT PRIMARY KEY AUTO_INCREMENT, 
									  id_produto INT NOT NULL, 
									  qtd_comprada INT NOT NULL, 
CONSTRAINT fk_id_produto 
FOREIGN KEY (id_produto) REFERENCES tb_produto (id));
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER tr_insert_atualiza_estoque 
AFTER INSERT 
ON tb_venda
FOR EACH ROW
BEGIN
   UPDATE tb_produto SET quantidade = ( quantidade - NEW.qtd_comprada)
   WHERE id = new.id_produto;
END //
DELIMITER ;
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


DELIMITER //
CREATE TRIGGER tr_delete_atualiza_estoque 
AFTER DELETE
ON tb_venda
FOR EACH ROW
BEGIN
   UPDATE tb_produto SET quantidade = ( quantidade + OLD.qtd_comprada)
   WHERE id = old.id_produto;
END //
DELIMITER ;

DELETE FROM tb_venda WHERE id = 1;
#------------------------------------------------------------------------------ TRIGGER INSERT
DROP TRIGGER tr_insert_atualiza_estoque;
DELIMITER //
CREATE TRIGGER tr_insert_atualiza_estoque 
before INSERT 
ON tb_venda
FOR EACH ROW
BEGIN
   DECLARE quantidade_estoque INT;
   SET quantidade_estoque = (SELECT quantidade FROM tb_produto
							  WHERE id = NEW.id_produto);
CASE                               
WHEN quantidade_estoque < NEW.qtd_comprada THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'quantidade em estoque insuficiente';
WHEN quantidade_estoque >=  NEW.qtd_comprada THEN 
	UPDATE tb_produto SET quantidade = (quantidade - new.qtd_comprada)
	WHERE id = NEW.id_produto;
ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'venda não realizada';
end case;
END //
DELIMITER ;

#------------------------------------------------------------------------------ TRIGGER DELETE
DROP TRIGGER tr_delete_atualiza_estoque;
DELIMITER //
CREATE TRIGGER tr_delete_atualiza_estoque 
BEFORE DELETE
ON tb_venda
FOR EACH ROW
BEGIN
CASE 
    WHEN EXISTS (select id FROM tb_produto WHERE id = old.id_produto) THEN
       UPDATE tb_produto SET quantidade = ( quantidade + OLD.qtd_comprada)
	   WHERE id = old.id_produto;
    ELSE 
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ' não foi possivel excluir a venda'; 
  END CASE;
END //
DELIMITER ;

#------------------------------------------------------------------------------ TRIGGER UPDATE


DELIMITER //
CREATE TRIGGER tr_delete_atualiza_estoque 
BEFORE DELETE
ON tb_venda
FOR EACH ROW
BEGIN

DECLARE estoque_atual INT;

DECLARE valida_estoque INT;

SET estoque_atual = (SELECT quantidade FROM tb_produto 
					   WHERE id = NEW.id_produto);

SET valida_estoque =(SELECT quantidade + ( OLD.qtd_comprada - NEW.qtd_comprada) 
                      FROM tb_produto 
					   WHERE id = NEW.id_produto);
 
IF valida_estoque < 0 THEN 
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'quantidade em estoque insuficiente';
ELSEIF 
	  valida_estoque = estoque_atual  THEN 
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'quantidade atualizada é igual a anterior ';
     UPDATE tb_produto 
SET quantidade = ( OLD.qtd_comprada + NEW.qtd_comprada)
     WHERE id = old.id_produto;
END IF;
END //
DELIMITER ;




drop trigger tr_adcionar_musica;
DELIMITER //

CREATE TRIGGER tr_adcionar_musica
before INSERT 
on tb_disco
for each row 
begin
declare duracao_total TIME;
SET duracao_total = (SELECT (new.duracao + old.duracao) from tb_disco);
UPDATE tb_disco SET id = id_disco; 
end//
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_tempo_total_do_disco
before INSERT 
on tb_disco
for each row 
begin
     UPDATE tb_disco SET duracao = 
 new.duracao > old.duracao 
     where duracao = SEC_TO_TIME
								(TIME_TO_SEC(old.duracao) + TIME_TO_SEC(new.duracao)) 
 AND id = id_disco;
 end//
DELIMITER ;

