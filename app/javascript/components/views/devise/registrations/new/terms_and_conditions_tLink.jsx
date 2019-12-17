import React from 'react'
import Checkbox from '../../../../src/components/FormsLayout/Fields/Checkbox'

const TermsAndConditionsTLink = ({session_translation, terms_and_conditions_file_path}) =>
  <>
    <a className='a-link--terms_and_conditions'target="_blank" href={terms_and_conditions_file_path}>
      {session_translation.tc_link}
    </a>
    <Checkbox
      description={session_translation.tc_label}
      isRequired
    />
  </>

export default TermsAndConditionsTLink