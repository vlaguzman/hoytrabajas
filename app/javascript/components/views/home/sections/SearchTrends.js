import React from 'react'
import PropTypes from 'prop-types'

const SearchTrends = ({ searchTrendsParams, translations }) => {

  return (
    <div className="t-home__searchTrends">
      <h4 className="homeTitle color__blue-main">{translations.title}</h4>
      <div className="trendsGrid">
        {Object.keys(searchTrendsParams).map(trendGroup => (
          <div key={trendGroup} className="singleTrend">
            <h6 className="a-typo__body1 color__blue-main fw-bold mb-30">
              {translations.subtitles[trendGroup]}
            </h6>
            <ul>
              {searchTrendsParams[trendGroup].map( trend => (
                <li key={trend.id}>
                  <a className="--trendLink" href={`/offers?search[${trendGroup}]=${trend.id}`}>{trend.description}</a>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </div>
    </div>
  )
}

SearchTrends.propTypes = {
  searchTrends: PropTypes.object,
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitles: PropTypes.shape({
      cities: PropTypes.string.isRequired,
      job_categories: PropTypes.string.isRequired,
      work_positions: PropTypes.string.isRequired,
      work_modes: PropTypes.string.isRequired,
      working_days: PropTypes.string.isRequired
    }).isRequired
  })
}

export default SearchTrends
