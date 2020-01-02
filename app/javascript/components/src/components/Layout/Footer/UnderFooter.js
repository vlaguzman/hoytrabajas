import React, { useState } from 'react'
import PropTypes from 'prop-types'
// import TextField from '@material-ui/core/TextField'
// import LanguageIcon from '@material-ui/icons/Language'

const Logo = () => (
  <div className="underFooter__logo">
    <img
      src="/assets/static/img/appLogoW.svg"
      className="d-block"
      alt="site logo"
    />
  </div>
)

// const languages = [
//   {
//     id: '123',
//     name: 'Español'
//   },
//   {
//     id: '456',
//     name: 'English'
//   }
// ]

const UnderFooter = ({ translations, windowSize, paths }) => {
  // TODO: uncomment to activate the language button
  // const [languageId, setLanguageId] = useState(languages[0].id)
  // const handleChange = event => setLanguageId(event.target.value)
  // const languageDisplayName = languages.find(item => item.id === languageId)
  //   .name

  return (
    <div className="m-footer__underFooter">
      <div className="underFooter__wrapper">
        <div className="underFooter__paths">
          {windowSize.width > 992 && <Logo />}
          <ul className="underFooter__navItems">
            {Object.keys(translations.nav_links).map(
              pathKey =>
                paths[pathKey] && (
                  <li className="li-item">
                    <a href={paths[pathKey]}>
                      {translations.nav_links[pathKey]}
                    </a>
                  </li>
                )
            )}
          </ul>
          {/* <div className="underFooter__language">
            <TextField
              select
              value={languageId}
              onChange={handleChange}
              variant="outlined"
              SelectProps={{
                renderValue: () => (
                  <div
                    className="d-flex align-items-center"
                    style={{ padding: '12px 30px' }}
                  >
                    <LanguageIcon style={{ marginRight: '10px' }} />
                    {languageDisplayName}
                  </div>
                )
              }}
            >
              {languages.map(option => (
                <option key={option.id} value={option.id}>
                  {option.name}
                </option>
              ))}
            </TextField>
          </div> */}
        </div>
        <div className="underFooter__divider" />
        <div className="underFooter__copyright">
          {windowSize.width <= 992 && <Logo />}
          <div>
            <span>{translations.copyright.support_of}</span>
            <img
              className="underFooter__rockstart"
              src="/assets/static/img/logo_rock.png"
              alt="Rockstart"
            />
          </div>
          <div className="underFooter__developedBy">
            {translations.copyright.developed_by}
            {windowSize.width > 992 ? (
              ` - ${translations.copyright.reserved_rights}`
            ) : (
              <>
                <br />
                {translations.copyright.reserved_rights}
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default UnderFooter

UnderFooter.propTypes = {
  translations: PropTypes.shape({
    nav_links: PropTypes.object.isRequired,
    copyright: PropTypes.object.isRequired
  }).isRequired,
  paths: PropTypes.shape({
    faq: PropTypes.string.isRequired,
    contact: PropTypes.string.isRequired,
    terms_and_conditions: PropTypes.string.isRequired
  }).isRequired,
  windowSize: PropTypes.object
}
