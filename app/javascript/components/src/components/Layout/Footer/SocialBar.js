import React from 'react'
import PropTypes from 'prop-types'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import {
  faFacebookF,
  faInstagram,
  faTwitter,
  faWhatsapp
} from '@fortawesome/free-brands-svg-icons'

const SocialBar = ({
  translations,
  social_url_twitter,
  social_url_whatsapp,
  social_url_instagram,
  social_url_facebook
}) => {
  return (
    <div className="m-footer__socialBar">
      <div className="socialWrapper">
        <div className="description">
          <p className="fw-bold m-0">{translations.description}</p>
        </div>

        <div className="shareIcons">
          <p className="shareIcons__followUs">{translations.follow_us}</p>
          <div className="socialIcons">
            <a
              href={social_url_facebook}
              rel="noopener noreferrer"
              target="_blank"
              className="socialIcons__icon d-flex align-items-center"
            >
              <FontAwesomeIcon icon={faFacebookF} />
            </a>
            <a
              href={social_url_instagram}
              target="_blank"
              rel="noopener noreferrer"
              className="socialIcons__icon d-flex align-items-center"
            >
              <FontAwesomeIcon icon={faInstagram} />
            </a>
            <a
              href={social_url_twitter}
              target="_blank"
              rel="noopener noreferrer"
              className="socialIcons__icon d-flex align-items-center"
            >
              <FontAwesomeIcon icon={faTwitter} />
            </a>
            <a
              href={social_url_whatsapp}
              target="_blank"
              rel="noopener noreferrer"
              className="socialIcons__icon d-flex align-items-center"
            >
              <FontAwesomeIcon icon={faWhatsapp} />
            </a>
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
  }),
  social_url_twitter: PropTypes.string.isRequired,
  social_url_whatsapp: PropTypes.string.isRequired,
  social_url_instagram: PropTypes.string.isRequired,
  social_url_facebook: PropTypes.string.isRequired
}
