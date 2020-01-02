import React from 'react'
import PropTypes from 'prop-types'

const UpperFooter = ({ translations, paths }) => (
  <div className="m-footer__upperFooter">
    <div className="upperFooter__gridContainer">
      {Object.keys(translations).map(key =>
        key === 'coming_soon' ? null : (
          <div className="upperFooter__gridItem">
            <h6 className="title">{translations[key].title}</h6>
            <ul>
              {Object.keys(translations[key].paths).map(pathKey => (
                <li className="li-item">
                  {paths[key] && paths[key][pathKey] ? (
                    <a href={paths[key][pathKey]}>
                      {translations[key]['paths'][pathKey]}
                    </a>
                  ) : (
                    paths[key][pathKey] !== null &&
                    translations[key]['paths'][pathKey]
                  )}
                </li>
              ))}
            </ul>
          </div>
        )
      )}
      <div className="upperFooter__gridItem">
        <h6 className="title">{translations.coming_soon.title}</h6>
        <ul>
          <li className="li-item">{translations.coming_soon.description}</li>
        </ul>
        <div className="upperFooter__appIcons">
          <img
            src="/assets/static/img/icon-apple-store.png"
            alt="Apple Store"
            className="mr-10 mt-10"
          />
          <img
            src="/assets/static/img/icon-google-play.png"
            alt="Google Play"
            className="mt-10"
          />
        </div>
      </div>
    </div>
  </div>
)

export default UpperFooter

UpperFooter.propTypes = {
  translations: PropTypes.shape({
    candidates: PropTypes.object.isRequired,
    companies: PropTypes.object.isRequired,
    contact_us: PropTypes.object.isRequired,
    coming_soon: PropTypes.object.isRequired
  }).isRequired,
  paths: PropTypes.shape({
    candidates: PropTypes.object.isRequired,
    companies: PropTypes.object.isRequired,
    contact_us: PropTypes.object.isRequired
  })
}
