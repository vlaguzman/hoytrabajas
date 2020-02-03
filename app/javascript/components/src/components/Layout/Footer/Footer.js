import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { Collapse } from 'reactstrap'
import UpperFooter from './UpperFooter'
import UnderFooter from './UnderFooter'
import SocialBar from './SocialBar'
import useWindowSize from '../../../hooks/useWindowSize'

const Footer = ({
  footer_translations,
  terms_and_conditions_file_path,
  search_offers,
  companies,
  create_offers,
  faqs,
  social_url_twitter,
  social_url_whatsapp,
  social_url_instagram,
  social_url_facebook
}) => {
  const underFooterPaths = {
    faq: faqs,
    contact: null,
    terms_and_conditions: terms_and_conditions_file_path
  }

  const upperFooterPaths = {
    candidates: {
      search_offers,
      roles: null,
      premium: null,
      companies
    },
    companies: {
      create_offers,
      on_demand: null,
      company_prime: null
    },
    contact_us: {
      email: 'mailto:info@hoytrabajas.com'
    }
  }

  const windowSize = useWindowSize()
  const [isOpen, setIsOpen] = useState(windowSize.width > 576)

  const handleToggle = () => setIsOpen(prevState => !prevState)

  useEffect(() => {
    if (windowSize.width > 576) setIsOpen(true)
  }, [windowSize])

  return (
    <footer className="d-flex flex-column animated fadeIn">
      {windowSize.width <= 576 && (
        <div>
          <button
            type="button"
            onClick={handleToggle}
            className="a-button__toggleFooter"
          >
            <span className={isOpen ? 'opened' : ''}>
              {footer_translations.toggle_button}
            </span>
          </button>
        </div>
      )}
      <Collapse isOpen={isOpen}>
        <SocialBar
          translations={footer_translations.social_bar}
          social_url_twitter={social_url_twitter}
          social_url_whatsapp={social_url_whatsapp}
          social_url_instagram={social_url_instagram}
          social_url_facebook={social_url_facebook}
        />
        <UpperFooter
          translations={footer_translations.upper_footer}
          paths={upperFooterPaths}
        />
        <UnderFooter
          paths={underFooterPaths}
          windowSize={windowSize}
          translations={footer_translations.under_footer}
          termAndConditionsPath={terms_and_conditions_file_path}
        />
      </Collapse>
    </footer>
  )
}

export default Footer

Footer.propTypes = {
  footer_translations: PropTypes.object.isRequired,
  terms_and_conditions_file_path: PropTypes.string.isRequired,
  search_offers: PropTypes.string.isRequired,
  companies: PropTypes.string.isRequired,
  create_offers: PropTypes.string.isRequired,
  faqs: PropTypes.string.isRequired
}
