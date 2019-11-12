import React from 'react'
import PropTypes from 'prop-types'
import Presentation from './sections/Presentation'
import FirstSection from './sections/FirstSection'
import SecondSection from './sections/SecondSection'
import ThirdSection from './sections/ThirdSection'
import FourthSection from './sections/FourthSection'

const ProfilePage = props => {
  const { formInfo } = props
  const {
    basic_info,
    about_user = null,
    user_interests = null,
    skills = null,
    experience = null
  } = formInfo

  return (
    <>
      <Presentation name={basic_info.fields.name.current_value || null} />
      <FirstSection {...{ basic_info, about_user, user_interests }} />
      {skills && <SecondSection {...skills} />}
      {experience && <ThirdSection {...experience} />}
      <FourthSection />
    </>
  )
}

export default ProfilePage

ProfilePage.propTypes = {
  formInfo: PropTypes.shape({
    basic_info: PropTypes.object.isRequired,
    about_user: PropTypes.object,
    user_interests: PropTypes.object,
    skills: PropTypes.object,
    experience: PropTypes.object
  }).isRequired
}
