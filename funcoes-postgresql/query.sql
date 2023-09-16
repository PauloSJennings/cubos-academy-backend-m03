SELECT COUNT(*) FROM farmacia;

SELECT MIN(idade) FROM usuarios;

SELECT MAX(idade) FROM usuarios;

SELECT AVG(idade) AS "mediaIdades" FROM usuarios WHERE idade >= 18;

SELECT SUM(estoque) AS "somaEstoque" FROM farmacia WHERE categoria = 'blue' OR categoria = 'black';

SELECT categoria, SUM(estoque) FROM farmacia GROUP BY categoria;

SELECT SUM(estoque) FROM farmacia WHERE categoria = NULL;

SELECT COUNT(*) FROM farmacia WHERE categoria = NULL;

SELECT CONCAT(medicamento, ' (', categoria, ')') AS "nomeCategoria" FROM farmacia;

SELECT CONCAT(id, ' - ', medicamento, ' (', COALESCE(categoria, 'sem categoria'), ')') AS "nomeCategoria" FROM farmacia;

SELECT nome, idade, cadastro::DATE FROM usuarios WHERE cadastro >= '2020-01-01' AND cadastro <= '2020-12-12';

SELECT nome, idade, email, AGE(cadastro::TIMESTAMP) AS "tempoDeCadastro" FROM usuarios WHERE idade >= 18;

SELECT nome, idade, email, AGE(cadastro::DATE) AS "tempoDeCadastro" FROM usuarios WHERE idade >= 60;

SELECT categoria, COUNT(*) FROM farmacia GROUP BY categoria;

SELECT idade, COUNT(*) AS "usuariosPorIdade" FROM usuarios WHERE idade >= 18 GROUP BY idade;


