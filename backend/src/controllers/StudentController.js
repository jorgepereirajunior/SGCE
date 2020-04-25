const connection = require('../database/connection')


module.exports = {

    async list(req,res) {

        const studentpd = await connection('vw_listSudentsPD').select('*')
    
        return res.json(studentpd)
    }
}