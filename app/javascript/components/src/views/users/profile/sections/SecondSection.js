import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import Paper from '@material-ui/core/Paper'
import { Row, Col } from 'reactstrap'
import DataCard from '../../../../components/Cards/DataCard'
import PaperHeader from '../../../../components/PaperHeader'
import EditInfoButton from '../../../../components/Cards/DataCard/EditInfoButton'
import ProfileChart from '../../../../components/Cards/DataCard/Content/ProfileChart'
import ProfileList from '../../../../components/Cards/DataCard/Content/ProfileList'
import ProfileTechnicalSkills from '../../../../components/Cards/DataCard/Content/ProfileTechnicalSkills'
import ProfileOtherSkills from '../../../../components/Cards/DataCard/Content/ProfileOtherSkills'

const SecondSection = props => {
  const { soft_skills, technical_skills, other_skills, languages } = props

  return (
    <>
      <Row className="justify-content-between w-100 px-20 mx-0 my-20">
        <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
          <PaperHeader titulo="Habilidades" />
          <Row className="w-100 justify-content-start pl-10">
            <Typography variant="h6" className="fw-bold text-left">
              Blandas
            </Typography>
          </Row>
          <Row className="w-100">
            <Col className="py-10 px-0" xs={12} sm={12} lg={8}>
              <DataCard haveContent>
                <ProfileChart list={soft_skills.list || []} />
              </DataCard>
            </Col>
            <Col className="py-10 px-0" xs={12} sm={12} lg={4}>
              <DataCard headerKind="onlyTitle" titleSec="Idiomas" haveContent>
                <ProfileList list={languages.list || []} />
              </DataCard>
            </Col>
          </Row>
          <ProfileTechnicalSkills list={technical_skills.list || []} />
          <ProfileOtherSkills list={other_skills.list || []} />
          <EditInfoButton editPath="/" text="Editar información" />
        </Paper>
      </Row>
    </>
  )
}

export default SecondSection

SecondSection.propTypes = {
  soft_skills: PropTypes.object,
  technical_skills: PropTypes.object,
  other_skills: PropTypes.object,
  languages: PropTypes.object
}
