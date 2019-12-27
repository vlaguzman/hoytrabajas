import React from 'react'
import PropTypes from 'prop-types'

const defaultPaths = {
  faq: '/faqs',
  contact: '/',
  terms_and_conditions:
    '/https://ht-web-docs.s3.amazonaws.com/hoytrabajas_tyc.pdf'
}

const Logo = () => (
  <div className="underFooter__logo">
    <img
      src="/assets/static/img/appLogoW.svg"
      className="d-block"
      alt="site logo"
    />
  </div>
)

const UnderFooter = ({ translations, windowSize, paths = defaultPaths }) => {
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
          <div className="underFooter__language">Selecthere</div>
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
  }).isRequired
}
