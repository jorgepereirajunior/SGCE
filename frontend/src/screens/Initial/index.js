import React from 'react'
import { Link } from 'react-router-dom'

import './styles.css'

export default function Initial() {

    return (
        <div className="initial-container">
            <div className="initial-header">
                <header>
                    <h1>Página Inicial</h1>
                </header>
            </div>
            
            <section>
                <form>
                    <ul>
                        <li><button type="submit">Listar Departamentos</button></li>
                        <Link to="/dptregister"><li><button type="submit">Cadastrar Departamentos</button></li></Link>
                        <li><button type="submit">Listar Disciplinas</button></li>
                        <li><button type="submit">Cadastrar Disciplinas</button></li>
                    </ul>
                    
                </form>
            </section>

            
        </div>
    )
}