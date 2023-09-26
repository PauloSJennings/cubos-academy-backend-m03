CREATE DATABASE ecommerce;

CREATE TABLE categorias (
	id serial primary key,
  nome varchar(50) not null
);


CREATE TABLE vendedores(
	cpf char(11) unique primary key,
  nome varchar(150)
);


CREATE TABLE clientes(
	cpf char(11) unique primary key,
  nome varchar(150)
);


CREATE TABLE pedidos(
	id serial primary key,
  valor integer not null,
  cliente_cpf char(11) not null references clientes(cpf),
  vendedor_cpf char(11) not null references vendedores(cpf)
);


CREATE TABLE produtos(
	id serial primary key,
  nome varchar(100) not null,
  descricao text,
  preco integer not null,
  quantidade_em_estoque integer,
  categoria_id integer references categorias(id)
);


CREATE TABLE itens_do_pedido(
	id serial primary key,
  pedido_id integer references pedidos(id),
  quantidade integer not null,
  produto_id integer references produtos(id)
);


INSERT INTO categorias (nome)
VALUES
('frutas'),
('verduras'),
('massas'),
('bebidas'),
('utilidades');


INSERT INTO produtos
(nome, descricao, preco, quantidade_em_estoque, categoria_id)
VALUES
('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1),
('Maça', 'Fonte de potássio e fibras.', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1);


INSERT INTO clientes (cpf, nome)
VALUES
('8031350042', 'José Augusto Silva'),
('67642869061', 'Antonio Oliveira'),
('63193310034', 'Ana Rodrigues'),
('75670505018', 'Maria da Conceição');


INSERT INTO vendedores (cpf, nome)
VALUES
('82539841031', 'Rodrigo Sampaio'),
('23262546003', 'Beatriz Souza Santos'),
('28007155023', 'Carlos Eduardo');


INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES
(300, '8031350042', '28007155023'),
(700, '8031350042', '28007155023'),
(7200, '8031350042', '28007155023'),
(1000, '8031350042', '28007155023'),
(450, '8031350042', '28007155023');

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES
(1980, '63193310034', '23262546003'),
(1260, '63193310034', '23262546003'),
(1500, '63193310034', '23262546003'),
(1250, '63193310034', '23262546003'),
(470, '63193310034', '23262546003');

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES
(2350, '75670505018', '23262546003'),
(780, '75670505018', '23262546003'),
(990, '75670505018', '23262546003');

INSERT INTO pedidos (valor, cliente_cpf, vendedor_cpf)
VALUES
(3360, '67642869061', '82539841031'),
(875, '67642869061', '82539841031'),
(594, '67642869061', '82539841031'),
(1000, '67642869061', '82539841031'),
(2400, '67642869061', '82539841031');


INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(1, 1, 1),
(2, 1, 10),
(3, 6, 11),
(4, 1, 15),
(5, 5, 2);

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(6, 10, 17),
(7, 3, 18),
(8, 5, 1),
(9, 10, 5),
(10, 2, 6);

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(11, 1, 13),
(12, 6, 12),
(13, 5, 17);

INSERT INTO itens_do_pedido (pedido_id, quantidade, produto_id)
VALUES
(14, 8, 18),
(15, 1, 8),
(16, 3, 17),
(17, 8, 5),
(18, 2, 11);


