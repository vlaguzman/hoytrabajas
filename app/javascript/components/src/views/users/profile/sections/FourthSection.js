import React, { useState } from 'react'
import PropTypes from 'prop-types'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import PaperHeader from '../../../../components/PaperHeader'
import AuxiliaryButtons from '../components/AuxiliaryButtons'
import ProfileDegrees from '../../../../components/Cards/DataCard/Content/ProfileDegrees'
import ProfileDiplomas from '../../../../components/Cards/DataCard/Content/ProfileDiplomas'

const FourthSection = ({ education_degrees, education_diplomas }) => {
  const {
    list: degreesList = null,
    editPath: degreesEditPath = null
  } = education_degrees
  const {
    list: diplomasList = null,
    editPath: diplomasEditPath = null
  } = education_diplomas

  const [showDegrees, setShowDegrees] = useState(true)

  return (
    <Row className="justify-content-between w-100 px-20 mx-0 my-20">
      <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
        <PaperHeader titulo="Formación académica" />
        <AuxiliaryButtons
          showDegrees={showDegrees}
          setShowDegrees={setShowDegrees}
        />
        {showDegrees ? (
          <ProfileDegrees list={degreesList} editPath={degreesEditPath} />
        ) : (
          <ProfileDiplomas list={diplomasList} editPath={diplomasEditPath} />
        )}
      </Paper>
    </Row>
  )
}

export default FourthSection

FourthSection.propTypes = {
  education_degrees: PropTypes.shape({
    list: PropTypes.shape({
      degree: PropTypes.string,
      institution_name: PropTypes.string,
      city_id: PropTypes.string,
      start_date: PropTypes.object,
      finish_date: PropTypes.object,
      ongoing_study: PropTypes.bool
    }),
    editPath: PropTypes.string.isRequired
  }),
  education_diplomas: PropTypes.shape({
    list: PropTypes.object,
    editPath: PropTypes.string.isRequired
  })
}
