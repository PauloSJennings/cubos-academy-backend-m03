const pool = require('../conexao');

async function listaPokemon(req, res) {
    try {

        const { rows } = await pool.query('select * from pokemons');

        rows.forEach((elemento) => { elemento.habilidades = elemento.habilidades.split(', ') });

        return res.status(200).json(rows);
    } catch (error) {

        return res.status(500).json(error.message);

    }
}

async function cadastraPokemon(req, res) {
    const { nome, habilidades, imagem, apelido } = req.body;

    const { id } = req.usuario;

    if (!nome || !habilidades) {
        return res.status(400).json({ mensagem: 'Os campos "Nome" e "Habilidades" são obrigatórios.' });
    }

    try {

        const novoPokemon = await pool.query('insert into pokemons (usuario_id, nome, habilidades, imagem, apelido) values ($1, $2, $3, $4, $5) returning *', [id, nome, habilidades, imagem, apelido]);

        return res.status(201).json(novoPokemon.rows[0]);
    } catch (error) {

        return res.status(500).json(error.message);

    }
}

async function alteraApelido(req, res) {
    const { id, apelido } = req.body;

    try {

        const novoApelido = await pool.query('update pokemons set apelido = $1 where id = $2 returning *', [apelido, id]);

        if (novoApelido.rowCount === 0) {
            return res.status(404).json({ mensagem: 'Pokemon não encontrado' });
        }

        return res.status(201).json(novoApelido.rows[0]);

    } catch (error) {
        return res.status(500).json(error.message);
    }
}

async function pokemonPorId(req, res) {
    const { id } = req.params;

    try {

        const pokemon = await pool.query('select * from pokemons where id = $1', [id]);

        if (pokemon.rowCount === 0) {
            return res.status(404).json({ mensagem: 'Pokemon não encontrado' });
        }

        pokemon.rows[0].habilidades = pokemon.rows[0].habilidades.split(', ');

        return res.status(200).json(pokemon.rows[0]);

    } catch (error) {
        return res.status(500).json({ mensagem: error.message });
    }
}

async function deletaPokemon(req, res) {
    const { id } = req.body;

    try {
        const pokemonDeletado = await pool.query('delete from pokemons where id = $1 returning *', [id]);

        if (pokemonDeletado.rowCount === 0) {
            return res.status(404).json({ mensagem: 'Pokemon não encontrado' });
        }

        return res.status(200).json(pokemonDeletado.rows[0]);
    } catch (error) {
        return res.status(500).json({ mensagem: error.message });
    }
}

module.exports = {
    listaPokemon,
    cadastraPokemon,
    alteraApelido,
    pokemonPorId,
    deletaPokemon
}