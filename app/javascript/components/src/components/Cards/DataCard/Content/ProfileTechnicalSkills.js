import React from 'react'
import PropTypes from 'prop-types'
import Typography from '@material-ui/core/Typography'
import { Row, Col } from 'reactstrap'
import Divider from '@material-ui/core/Divider'
import Chip from '@material-ui/core/Chip'
import DataCard from '..'
import CardHeader from '../CardHeader'
import ProfileAddContent from './ProfileAddContent'

const ProfileTechnicalSkills = ({ list }) => {
  return (
    <>
      <Row className="w-100 justify-content-start mt-60 pl-10">
        <Typography variant="h6" className="fw-bold text-left">
          Técnicas
        </Typography>
      </Row>
      <Row className="w-100">
        {list.length > 0 ? (
          <>
            {list.map(({ name, category, level, validated_by = 0 }) => (
              <Col key={name} className="py-10 px-0" xs={12} sm={6} lg={4}>
                <DataCard haveContent>
                  <CardHeader titleSec={name} titleIcon upActions />
                  <Divider variant="middle" className="mx-0 my-10 mb-20" />
                  <div className="d-flex justify-content-between">
                    <div className="align-items-center">
                      <Chip
                        className="p-5"
                        variant="outlined"
                        label={category}
                      />
                    </div>
                    <div classame="justify-content-end align-items-center">
                      <Typography
                        variant="body2"
                        className="fw-bold"
                        color="primary"
                        component="p"
                        style={{ margin: 'auto' }}
                      >
                        {level}
                      </Typography>
                    </div>
                  </div>
                  {!!validated_by && (
                    <Col className="mt-30">
                      <Typography
                        variant="h5"
                        className="fw-bold text-center"
                        color="textSecondary"
                        component="p"
                      >
                        {validated_by}
                      </Typography>
                      <Typography
                        variant="body1"
                        className="text-center"
                        color="textSecondary"
                        component="p"
                      >
                        Personas han validado tus habilidades
                      </Typography>
                    </Col>
                  )}
                </DataCard>
              </Col>
            ))}
          </>
        ) : (
          <ProfileAddContent
            text="Agregar información"
            content="Al parecer no has registrado tus habilidades técnicas."
            afterContent="¡Agrégalas ahora!"
          />
        )}
      </Row>
    </>
  )
}

export default ProfileTechnicalSkills

ProfileTechnicalSkills.propTypes = {
  list: PropTypes.arrayOf(
    PropTypes.shape({
      name: PropTypes.string.isRequired,
      category: PropTypes.string.isRequired,
      level: PropTypes.string.isRequired,
      validated_by: PropTypes.number
    })
  ).isRequired
}
