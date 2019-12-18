import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from '@material-ui/core/styles'
import LinearProgress from '@material-ui/core/LinearProgress'
import { Row, Col } from 'reactstrap'
import styled from 'styled-components'

const ColorBlock = styled.div`
  width: 20px;
  height: 20px;
  background-color: ${props => props.backgroundColor};
  margin-left: 10px;
  border-radius: 3.6px;
`

const BorderLinearProgress = withStyles({
  root: {
    width: '100%',
    height: 24,
    borderRadius: 3.6,
    backgroundColor: '#e5e5e5'
  },
  bar: props => ({
    borderRadius: 3.6,
    backgroundColor: props.backgroundColor
  })
})(LinearProgress)

const colors = ['#51e9d5', '#94dad0', '#64b7ac']
const defaultList = [
  { description: 'Honestidad', value: 97 },
  { description: 'Empatía', value: 70 },
  { description: 'Responsabilidad', value: 30 }
]

const Skills = ({ list = defaultList }) => (
  <>
    <h6 className="fw-bold color__blue-main mt-30">
      Habilidades blandas validadas
    </h6>
    <div className="py-20">
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
                  key={skill.description}
                  className="d-flex align-items-center justify-content-center"
                  xs={11}
                  style={{ marginTop: index > 0 ? 15 : 0 }}
                >
                  <BorderLinearProgress
                    variant="determinate"
                    color="primary"
                    value={skill.value}
                    backgroundColor={colors[index]}
                  />
                </Col>
                <Col
                  className="d-flex align-items-center justify-content-end"
                  xs={1}
                  style={{ marginTop: index > 0 ? 15 : 0 }}
                >
                  <h5 className="fw-bold m-0">{skill.value}</h5>
                </Col>
              </>
            ))}
          </Row>
          <Row className="mt-20">
            {list.map((skill, index) => (
              <div
                key={skill.description}
                className="d-flex justify-content-center align-items-center mx-20"
              >
                <p className="a-typo__subtitle2 m-0 fw-bolder">
                  {skill.description}
                </p>
                <ColorBlock backgroundColor={colors[index]} />
              </div>
            ))}
          </Row>
        </>
      ) : null}
    </div>
    {/* HTML TO HAML SECTION */}
    <h6 className="fw-bold color__blue-main mt-30">Habilidades técnicas</h6>
    <div className="skillsGrid mt-30">
      <div className="gridItem">
        <p className="color__gray-main a-typo__body1 fw-bold m-0">
          Marketing y ventas
        </p>
        <div>
          <span className="a-chip__gray fw-normal d-inline-flex">Redes sociales</span>
        </div>
        <p className="a-typo__body1 fw-bolder m-0">Nivel avanzado</p>
      </div>
      <div className="gridItem">
        <p className="color__gray-main a-typo__body1 fw-bold m-0">
          Belleza bienestar y salud
        </p>
        <div>
          <span className="a-chip__gray fw-normal d-inline-flex">Redes sociales</span>
        </div>
        <p className="a-typo__body1 fw-bolder m-0">Nivel avanzado</p>
      </div>
    </div>
    {/* LANGUAGES */}
    <h6 className="fw-bold color__blue-main mt-30">Idiomas</h6>
    <div className="skillsGrid mt-30">
      <div className="gridItem">
        <p className="color__gray-main a-typo__body1 fw-bold m-0">Español</p>
        <p className="a-typo__body1 languageLevel m-0 fw-bolder">
          Lengua nativa
        </p>
      </div>
      <div className="gridItem">
        <p className="color__gray-main a-typo__body1 fw-bold m-0">Inglés</p>
        <p className="a-typo__body1 languageLevel m-0 fw-bolder">Avanzado</p>
      </div>
      <div className="gridItem">
        <p className="color__gray-main a-typo__body1 fw-bold m-0">Francés</p>
        <p className="a-typo__body1 languageLevel m-0 fw-bolder">Básico</p>
      </div>
    </div>
  </>
)

export default Skills

Skills.propTypes = {
  list: PropTypes.arrayOf(
    PropTypes.shape({
      description: PropTypes.string.isRequired,
      value: PropTypes.number.isRequired
    })
  ).isRequired
}
