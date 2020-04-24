const express = require('express')

const routes = express.Router()


routes.get('/cadastro_aluno', (req,res) => {

    return res.json({
        "aluno": "Jorge Pereira Junior",
        "email": "teste@gmail.com"
    })
})

module.exports = routes