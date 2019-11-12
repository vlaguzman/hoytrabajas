import React from 'react'
import PropTypes from 'prop-types'
import { lighten, withStyles } from '@material-ui/core/styles'
import LinearProgress from '@material-ui/core/LinearProgress'
import Typography from '@material-ui/core/Typography'
import Divider from '@material-ui/core/Divider'
import { Row, Col } from 'reactstrap'
import styled from 'styled-components'
import ProfileAddContent from './ProfileAddContent'

const ColorBlock = styled.div`
  width: 20px;
  height: 20px;
  background-color: ${props => props.backgroundColor};
  margin-left: 10px;
  border-radius: 3.6px;
`

const BorderLinearProgress = withStyles({
  root: props => ({
    width: '100%',
    height: 24,
    borderRadius: 3.6,
    backgroundColor: lighten(props.backgroundColor, 0.5)
  }),
  bar: props => ({
    borderRadius: 3.6,
    backgroundColor: props.backgroundColor
  })
})(LinearProgress)

const colors = ['#6c5b7c', '#c67a90', '#f67280']

const ProfileChart = ({ list }) => (
  <div className="p-20">
    {list.length > 0 ? (
      <>
        <Row
          className="w-100 justify-content-center"
          noGutters
          style={{ margin: 'auto' }}
        >
          {list.map((skill, index) => (
            <>
              <Col
                key={skill.label}
                className="d-flex align-items-center justify-content-center"
                xs={11}
                style={{ marginTop: index > 0 ? 15 : 0 }}
              >
                <BorderLinearProgress
                  variant="determinate"
                  color="primary"
                  value={skill.value * 10}
                  backgroundColor={colors[index]}
                />
              </Col>
              <Col
                className="d-flex align-items-center justify-content-end"
                xs={1}
                style={{ marginTop: index > 0 ? 15 : 0 }}
              >
                <Typography variant="h4" component="span">
                  {skill.value}
                </Typography>
              </Col>
            </>
          ))}
        </Row>
        <Divider className="mt-40" />
        <Row className="mt-20 justify-content-center">
          {list.map((skill, index) => (
            <div
              key={skill.label}
              className="d-flex justify-content-center align-items-center mx-20"
            >
              <Typography variant="subtitle1" component="span">
                {skill.label}
              </Typography>
              <ColorBlock backgroundColor={colors[index]} />
            </div>
          ))}
        </Row>
      </>
    ) : (
      <ProfileAddContent
        text="Agregar información"
        content="Al parecer no has registrado tus habilidades blandas."
        afterContent="¡Agrégalas ahora!"
      />
    )}
  </div>
)

export default ProfileChart

ProfileChart.propTypes = {
  list: PropTypes.arrayOf(
    PropTypes.shape({
      label: PropTypes.string.isRequired,
      value: PropTypes.number.isRequired
    })
  ).isRequired
}
