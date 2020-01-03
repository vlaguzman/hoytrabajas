import React from 'react'
import PropTypes from 'prop-types'

const trends = [
  {
    name: 'cities',
    list: ['Bogotá', 'Medellín', 'Bucaramanga', 'Santa Marta', 'Villavicencio']
  },
  {
    name: 'categories',
    list: [
      'Gestión administrativa',
      'Ventas',
      'Operario',
      'Tecnología y programación',
      'Cocina, bar y meseros'
    ]
  },
  {
    name: 'positions',
    list: [
      'Auxiliar logístico',
      'Diseñador gráfico',
      'Mensajero',
      'Community manager',
      'Asesor contable'
    ]
  },
  {
    name: 'work_mode',
    list: ['Medio tiempo', 'Por horas', 'Tiempo completo', 'Fines de semana']
  },
  {
    name: 'working_hours',
    list: [
      'Mañana (7am-12pm)',
      'Tarde (12pm-5pm)',
      'Media tarde (5pm-10pm)',
      'Noche (10pm-3am)'
    ]
  }
]

const SearchTrends = ({ translations }) => {
  return (
    <div className="t-home__searchTrends">
      <h4 className="searchTrends__title color__blue-main">
        {translations.title}
      </h4>
      <div className="trendsGrid">
        {trends.map(singleTrend => (
          <div className="singleTrend">
            <h6 className="a-typo__body1 color__blue-main fw-bold mb-30">
              {translations.subtitles[singleTrend.name]}
            </h6>
            <ul>
              {singleTrend.list.map(listItem => (
                <li className="color__slategray-main">{listItem}</li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  )
}

SearchTrends.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitles: PropTypes.shape({
      cities: PropTypes.string.isRequired,
      categories: PropTypes.string.isRequired,
      positions: PropTypes.string.isRequired,
      work_mode: PropTypes.string.isRequired,
      working_hours: PropTypes.string.isRequired
    }).isRequired
  })
}

export default SearchTrends
