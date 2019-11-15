import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import DataCard from '..'
import CardHeader from '../CardHeader'
import ProfileAddContent from './ProfileAddContent'

const ProfileOtherSkills = ({ list }) => {
  return (
    <>
      <Row className="w-100 justify-content-start mt-60 pl-10">
        <Typography variant="h6" className="fw-bold text-left">
          Habilidades a aprender o reforzar
        </Typography>
      </Row>
      <Row className="w-100 external mt-30">
        {list.length > 0 ? (
          <>
            {list.map(title => (
              <Col key={title}>
                <DataCard haveContent>
                  <CardHeader centerTitleSec={title} upActions />
                </DataCard>
              </Col>
            ))}
          </>
        ) : (
          <ProfileAddContent
            text="Agregar información"
            content="¿Hay habilidades que quieras aprender o reforzar?"
            afterContent="¡Agrégalas ahora!"
          />
        )}
      </Row>
    </>
  )
}

export default ProfileOtherSkills

ProfileOtherSkills.propTypes = {
  list: PropTypes.array
}
