CREATE DATABASE lojaCabaitePOO;
USE lojaCabaitePOO;

CREATE TABLE pessoa
	(id_pessoa integer(6) PRIMARY KEY AUTO_INCREMENT,
     		nome varchar(100) NOT null,
	 		endereco varchar(300) NOT null,
	 			cpf integer(11) NOT null UNIQUE,
     					telefone integer(11) NOT null,
    						sexo enum('F', 'M') NOT null);
					
CREATE	TABLE produto
	(id_produto integer(6) PRIMARY KEY AUTO_INCREMENT,
     		descricao varchar(300) NOT null,
     			garantia datetime NOT null,
     				tipo varchar(50) NOT null,
     					preco_unitario decimal(6,2) NOT null);			
          
CREATE TABLE pedido
     (numero_pedido integer(6) PRIMARY KEY,
      	NF integer(6) AUTO_INCREMENT UNIQUE,
      		data_pedido datetime NOT null,
      			id_pessoa integer(6),
      				CONSTRAINT FK_id_pessoa FOREIGN KEY (id_pessoa) 								
					REFERENCES pessoa (id_pessoa));
					
CREATE TABLE itens_pedido
	(numero_pedido integer(6), 
	 	id_produto integer(6),
	 		quantidade decimal(6,2) unsigned NOT null,
	 			CONSTRAINT PK_numero_pedido PRIMARY KEY (numero_pedido),
    					CONSTRAINT FK_numero_pedido FOREIGN KEY (numero_pedido) REFERENCES pedido (numero_pedido),
						CONSTRAINT FK_id_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto));

#DADOS

INSERT INTO `pessoa` (`id_pessoa`, `nome`, `endereco`, `cpf`, `telefone`, `sexo`) VALUES ('1', 'Julio', 'rua de barro', '123', '3223', 'M');
INSERT INTO `pessoa` (`id_pessoa`, `nome`, `endereco`, `cpf`, `telefone`, `sexo`) VALUES ('2', 'Patrick', 'rua de barro', '321', '3223', 'M');
INSERT INTO `pessoa` (`id_pessoa`, `nome`, `endereco`, `cpf`, `telefone`, `sexo`) VALUES ('3', 'Agatha', 'rua de barro', '323', '3223', 'F');

INSERT INTO `produto` (`id_produto`, `descricao`, `garantia`, `tipo`, `preco_unitario`) VALUES ('1', 'HD', '2017.11.01', 'hardware', '300');
INSERT INTO `produto` (`id_produto`, `descricao`, `garantia`, `tipo`, `preco_unitario`) VALUES ('2', 'SSD', '2017.11.01', 'hardware', '500');
INSERT INTO `produto` (`id_produto`, `descricao`, `garantia`, `tipo`, `preco_unitario`) VALUES ('3', 'GPU', '2017.11.01', 'hardware', '1000');

INSERT INTO `itens_pedido` (`itens_pedido`, `quantidade`, `id_produto`) VALUES ('1', '10', '1');
INSERT INTO `itens_pedido` (`itens_pedido`, `quantidade`, `id_produto`) VALUES ('2', '20', '2');
INSERT INTO `itens_pedido` (`itens_pedido`, `quantidade`, `id_produto`) VALUES ('3', '5', '3');
										
