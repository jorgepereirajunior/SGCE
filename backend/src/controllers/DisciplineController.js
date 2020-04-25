const connection = require('../database/connection')


module.exports = {

    async list(req,res) {
                                                //TABELAS COM (VW) NO INICIO SÃO VIRTUAIS(VIEWS)
        const disciplinesbasic = await connection('vw_disciplinesBasic').select('*')
    
        return res.json(disciplinesbasic)
    }
}