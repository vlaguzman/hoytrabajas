import React from 'react'
import PropTypes from 'prop-types'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import {
  faFacebookF,
  faInstagram,
  faTwitter,
  faWhatsapp
} from '@fortawesome/free-brands-svg-icons'

const SocialBar = ({ translations }) => {
  return (
    <div className="m-footer__socialBar">
      <div className="socialWrapper">
        <div className="description">
          <p className="fw-bold m-0">{translations.description}</p>
        </div>

        <div className="shareIcons">
          <p className="shareIcons__followUs">{translations.follow_us}</p>
          <div className="socialIcons">
            <div className="socialIcons__icon d-flex align-items-center">
              <FontAwesomeIcon icon={faFacebookF} />
            </div>
            <div className="socialIcons__icon d-flex align-items-center">
              <FontAwesomeIcon icon={faInstagram} />
            </div>
            <div className="socialIcons__icon d-flex align-items-center">
              <FontAwesomeIcon icon={faTwitter} />
            </div>
            <div className="socialIcons__icon d-flex align-items-center">
              <FontAwesomeIcon icon={faWhatsapp} />
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
export default SocialBar

SocialBar.propTypes = {
  translations: PropTypes.shape({
    description: PropTypes.string.isRequired,
    follow_us: PropTypes.string.isRequired
  })
}
