import React from 'react'
import PropTypes from 'prop-types'
import { withStyles } from '@material-ui/core/styles'
import LinearProgress from '@material-ui/core/LinearProgress'
import { Row, Col } from 'reactstrap'

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

// TODO any: remove defaults when we have real data
const defaultList = [
  { description: 'Honestidad', value: 97 },
  { description: 'Empatía', value: 70 },
  { description: 'Responsabilidad', value: 30 }
]

const defaultTranslations = {
  title: 'Habilidades blandas validadas'
}

const Skills = ({ list = defaultList, translations = defaultTranslations }) => (
  <>
    <h6 className="fw-bold color__blue-main mt-30">{translations.title}</h6>
    <div className="skillsChart py-20">
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
                  className="d-flex align-items-center justify-content-center skillBar"
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
          <Row className="mt-20 skillChartNames">
            {list.map((skill, index) => (
              <div key={skill.description} className="mx-20 skillChartName">
                <p className="a-typo__subtitle2 m-0 fw-bolder">
                  {skill.description}
                </p>
                <div
                  className="skillColorBlock"
                  style={{ backgroundColor: colors[index] || colors[0] }}
                />
              </div>
            ))}
          </Row>
        </>
      ) : null}
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
  ).isRequired,
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired
  }).isRequired
}
