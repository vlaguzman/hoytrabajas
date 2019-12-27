import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { Collapse } from 'reactstrap'
import UpperFooter from './UpperFooter'
import UnderFooter from './UnderFooter'
import SocialBar from './SocialBar'
import useWindowSize from '../../../hooks/useWindowSize'

const Footer = ({ footer_translations, terms_and_conditions_file_path }) => {
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
        <SocialBar translations={footer_translations.social_bar} />
        <UpperFooter translations={footer_translations.upper_footer} />
        <UnderFooter
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
  terms_and_conditions_file_path: PropTypes.string.isRequired
}
