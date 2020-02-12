import React from 'react'
import PropTypes from 'prop-types'
import Checkbox from '../../../../src/components/FormsLayout/Fields/Checkbox'

const TermsAndConditionsTLink = ({
  session_translation,
  terms_and_conditions_file_path
}) => (
  <div className="m-termsAndConditions">
    <Checkbox
      disableRipple
      className="termsAndConditions__checkbox"
      description={
        <div className="a-link__termsAndConditions">
          {session_translation.tc_accept}
          <a target="_blank" href={terms_and_conditions_file_path}>
            {' '}
            {session_translation.tc_link}
          </a>
        </div>
      }
      isRequired
    />
  </div>
)

export default TermsAndConditionsTLink

TermsAndConditionsTLink.propTypes = {
  session_translation: PropTypes.shape({
    tc_accept: PropTypes.string.isRequired,
    tc_link: PropTypes.string.isRequired
  }),
  terms_and_conditions_file_path: PropTypes.string
}
