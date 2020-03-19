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
    experience = null,
    education = null
  } = formInfo

  return (
    <>
      <Presentation name={basic_info.fields.name.current_value || null} />
      <FirstSection {...{ basic_info, about_user, user_interests }} />
      {skills && <SecondSection {...skills} />}
      {experience && <ThirdSection {...experience} />}
      {education && <FourthSection {...education} />}
    </>
  )
}

export default ProfilePage

ProfilePage.propTypes = {
  formInfo: PropTypes.shape({
    basic_info: PropTypes.object.isRequired,
    about_user: PropTypes.object,
    user_interests: PropTypes.object,
    skills: PropTypes.shape({
      soft_skills: PropTypes.object,
      technical_skills: PropTypes.object,
      other_skills: PropTypes.object,
      languages: PropTypes.object
    }),
    experience: PropTypes.object,
    education: PropTypes.shape({
      education_degrees: PropTypes.object,
      education_diplomas: PropTypes.object
    })
  }).isRequired
}
