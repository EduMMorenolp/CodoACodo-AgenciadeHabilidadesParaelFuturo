


export const procesarFiltros = (query) => {

    let filtros = query // objeto pasado por la ruta

    let consulta = 'SELECT * FROM productos'
    let whereClause = ''
    let values = []
    

    if (filtros.nombre) {
        whereClause += ` nombre LIKE '%${filtros.nombre}%' AND`
    }
    if (filtros.descripcion) {
        whereClause += ` descripcion LIKE '%${filtros.descripcion}%' AND`
    }
    if (filtros.precioMin) {
        whereClause += ` precio >= ? AND`
        values.push(filtros.precioMin)
    }
    if (filtros.precioMax) {
        whereClause += ` precio <= ? AND`
        values.push(filtros.precioMax)
    }

    // "SELECT * FROM productos WHERE nombre LIKE '%pc%' AND precio >= ? AND precio <= ? AND descripcion LIKE '%gamer%' ORDER BY precio asc", [100, 200]
    if (whereClause !== '') {
        whereClause = ' WHERE' + whereClause.slice(0, -3)
        consulta += whereClause;
    }

    if (filtros.orden) {
        consulta += ` ORDER BY precio ${filtros.orden}`
    }

    return { consulta, values }
}