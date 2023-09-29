const pool = require('../conexao');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const senhajwt = require('../senhajwt');

async function cadastraUsuario(req, res) {
    const { nome, email, senha } = req.body;

    if (!nome || !email || !senha) {
        res.status(400).json({ mensagem: 'Todos os campos são obrigatórios' });
    }

    const senhaHash = await bcrypt.hash(senha, 10);

    try {

        const novoUsuario = await pool.query('insert into usuarios (nome, email, senha) values ($1, $2, $3) returning *', [nome, email, senhaHash]);

        return res.status(201).json(novoUsuario.rows[0]);

    } catch (error) {

        return res.status(500).json(error.message);

    }
}

async function login(req, res) {
    const { email, senha } = req.body;

    if (!email || !senha) {
        return res.status(400).json({ mensagem: 'Todos os campos são obrigatórios.' });
    }

    try {
        const usuario = await pool.query('select * from usuarios where email = $1', [email]);

        if (usuario.rowCount === 0) {
            return res.status(404).json({ mensagem: 'Email ou senha inválidos.' });
        }

        const senhaValida = await bcrypt.compare(senha, usuario.rows[0].senha)

        if (!senhaValida) {
            return res.status(400).json({ mensagem: 'Email ou senha inválidos.' });
        }

        const token = jwt.sign({ id: usuario.rows[0].id, nome: usuario.rows[0].nome }, senhajwt, { expiresIn: '8h' });

        const { senha: _, ...usuarioLogado } = usuario.rows[0];


        return res.status(200).json({ usuario: usuarioLogado, token });

    } catch (error) {

        return res.status(500).json({ mensagem: error.message });

    }


}

module.exports = {
    cadastraUsuario,
    login
}