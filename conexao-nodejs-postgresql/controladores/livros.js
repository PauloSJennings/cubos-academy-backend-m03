const pool = require('../conexao');

async function cadastraLivro(req, res) {
    const { id } = req.params;
    const { nome, genero, editora, data_de_publicacao } = req.body;
    const query = 'insert into livros (nome, genero, editora, data_de_publicacao, autor_id) values ($1, $2, $3, $4, $5)';
    const params = [nome, genero, editora, data_de_publicacao, id];

    if (!nome) {
        return res.status(400).json({ message: 'O campo de NOME é obrigatório.' });
    }

    try {
        const resultado = await pool.query(query, params);

        return res.status(201).send();

    } catch (error) {

        return res.status(400).json({ message: 'Autor não encontrado.' }).send();

    }

}

async function listaLivros(req, res) {
    const query = `SELECT
	l.id,
    l.nome,
	l.genero,
	l.editora,
    l.data_de_publicacao,
    a.id as autor_id,
    a.nome as autor,
    a.idade
FROM livros l LEFT JOIN autores a
ON l.autor_id = a.id;`

    try {

        const resultado = await pool.query(query);

        const arrayResposta = resultado.rows.map(({ id, nome, genero, editora, data_de_publicacao, autor_id, autor, idade }) => ({
            id,
            nome,
            genero,
            editora,
            data_de_publicacao,
            dados_autor: {
                autor_id,
                autor,
                idade
            }
        }));

        return res.status(200).json(arrayResposta);

    } catch (error) {

        return res.json({ message: error.message });

    }
}

module.exports = {
    cadastraLivro,
    listaLivros
}