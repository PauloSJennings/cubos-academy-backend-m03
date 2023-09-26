const pool = require('../conexao');

async function getAutores(req, res) {
    const query = 'select * from autores'

    try {
        const resultado = await pool.query(query);

        return res.status(200).json(resultado.rows);
    } catch (error) {

        return res.json(error.message).send();

    }
}

async function cadastraAutor(req, res) {
    const { nome, idade } = req.body;
    const query = 'insert into autores (nome, idade) values ($1, $2)';
    const params = [nome, idade];

    if (!nome) {
        return res.status(400).json('O campo NOME é obrigatório');
    }

    try {

        const resultado = await pool.query(query, params);

        return res.status(201).send();

    } catch (error) {
        return res.json(error.message);
    }
}

async function autorPorId(req, res) {
    const { id } = req.params;
    const params = [id];
    const query = 'select a.id, a.nome, a.idade, l.id as livro_id, l.nome as titulo, l.editora, l.genero, l.data_de_publicacao from autores a left join livros l on a.id = l.autor_id where a.id = $1';

    try {
        const resultado = await pool.query(query, params);

        if (!resultado.rowCount) {
            return res.status(404).json({ message: 'Autor não encontrado.' });
        }

        const { id, nome, idade } = resultado.rows[0];

        const objLivros = []

        for ({ livro_id, titulo, editora, genero, data_de_publicacao } of resultado.rows) {
            objLivros.push({
                livro_id,
                titulo,
                editora,
                genero,
                data_de_publicacao
            })
        }


        let objResposta = {
            id,
            nome,
            idade,
            livros: objLivros
        }


        return res.json(objResposta);

    } catch (error) {

        return res.json(error.message);

    }
}

module.exports = {
    getAutores,
    cadastraAutor,
    autorPorId
}