import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Paper from '@material-ui/core/Paper'
import Typography from '@material-ui/core/Typography'
import Chip from '@material-ui/core/Chip'
import styled from 'styled-components'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import DataCard from '../../../../components/Cards/DataCard'
import EditInfoButton from '../../../../components/Cards/DataCard/EditInfoButton'
import PaperHeader from '../../../../components/PaperHeader'

const StyledCategory = styled.div`
  margin-top: 15px;
  border-radius: 4px;
  text-transform: uppercase;
  background-color: #c67a90;
  padding: 6px 12px;
  color: white;
  font-weight: 700;
  display: inline-block;
  font-size: 10px;
  align-self: flex-start;
`

const ThirdSection = ({ list, editPath }) => {
  const formatDate = date => format(date, 'MMMM yyyy', { locale: es })

  return (
    <Row className="justify-content-between w-100 px-20 mx-0 my-20">
      <Paper className="w-100 d-flex flex-column py-25 pr-20 paper-responsive-padding justify-content-center align-items-center">
        <PaperHeader titulo="Experiencia" />
        {list.length > 0 ? (
          <>
            <Row className="w-100 external">
              {list.map(
                ({
                  company_name,
                  work_position,
                  job_category,
                  responsibilities,
                  started_at,
                  finished_at,
                  still_in_progress
                }) => (
                  <Col
                    key={company_name + work_position}
                    xs={12}
                    sm={6}
                    md={4}
                    style={{ marginTop: 30 }}
                  >
                    <DataCard
                      middleDivider
                      headerKind="titleSubNoIconNoChipNoFavCloseEdit"
                      titleSec={company_name}
                      subTitleSec={work_position}
                      haveContent
                      actions
                      bottomButton
                      cardContentStyles={{
                        display: 'flex',
                        flexDirection: 'column',
                        flex: 1
                      }}
                    >
                      {!!started_at && (!!finished_at || still_in_progress) && (
                        <Typography
                          variant="caption"
                          className="fw-bold text-muted"
                          style={{ textTransform: 'capitalize' }}
                        >
                          {formatDate(started_at)} -{' '}
                          {still_in_progress
                            ? 'Actualidad'
                            : formatDate(finished_at)}
                        </Typography>
                      )}
                      {responsibilities && responsibilities.length > 0 && (
                        <>
                          <Typography
                            variant="body2"
                            className="fw-bold mt-15 mb-5"
                            component="p"
                          >
                            Responsabilidades
                          </Typography>
                          <Row className="px-10 flex-wrap justify-content-start my-10">
                            {responsibilities.map(resp => (
                              <Chip
                                key={resp}
                                className="mt-10 mr-5"
                                variant="outlined"
                                label={resp}
                              />
                            ))}
                          </Row>
                        </>
                      )}
                      {job_category && (
                        <>
                          <div className="mt-10" />
                          <StyledCategory>{job_category}</StyledCategory>
                        </>
                      )}
                    </DataCard>
                  </Col>
                )
              )}
            </Row>
            <EditInfoButton editPath="editPath" text="Editar información" />
          </>
        ) : (
          <Row className="w-100 justify-content-center">
            <Col
              xs={10}
              className="p-10"
              style={{ border: '.01rem dashed rgba(211,211,211, .9)' }}
            >
              <Typography variant="body1" className="text-center d-inline">
                Al parecer no has registrado tu experiencia.
                <span className="fw-bold mr-20"> ¡Agrégala ahora!</span>
                <EditInfoButton
                  editPath={editPath}
                  text="Agregar información"
                />
              </Typography>
            </Col>
          </Row>
        )}
      </Paper>
    </Row>
  )
}

export default ThirdSection

ThirdSection.propTypes = {
  list: PropTypes.arrayOf(
    PropTypes.shape({
      company_name: PropTypes.string.isRequired,
      work_position: PropTypes.string.isRequired,
      job_category: PropTypes.string.isRequired,
      responsibilities: PropTypes.array,
      started_at: PropTypes.date,
      finished_at: PropTypes.date,
      still_in_progress: PropTypes.boolean
    })
  ).isRequired,
  editPath: PropTypes.string.isRequired
}
