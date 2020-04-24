const express = require('express')
const connection = require('./database/connection')

const routes = express.Router()


routes.get('/cadastro_aluno', async (req,res) => {

    const cad_aluno = await connection('vw_cadastro_aluno').select('*')

    return res.json(cad_aluno)
})

module.exports = routes