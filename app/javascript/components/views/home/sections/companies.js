import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import CompaniesList from './components/companiesList'
import CarouselRow from '../../../src/components/Carousel/CarouselRow'
import useWindowSize from '../../../src/hooks/useWindowSize'

const catalogo = Array(12).fill(null)

const CompaniesSection = ({ translations }) => {
  const windowSize = useWindowSize()

  return (
    <div className="t-home__companies py-60">
      <div
        className="mt-20 mb-40 d-flex flex-column justify-content-center align-items-center"
        style={{ textAlign: 'center' }}
      >
        {windowSize.width > 576 ? (
          <>
            <h4 className="homeTitle a-typo__titleH4 color__blue-main">
              {translations.title}
            </h4>
            <h5 className="homeSubtitle a-typo__titleH5">
              {translations.subtitle}
            </h5>
          </>
        ) : (
          <h4 className="homeTitle a-typo__titleH4 color__blue-main">
            {`${translations.title} ${translations.subtitle}`}
          </h4>
        )}
      </div>
      <Row className="flex-wrap justify-content-center align-items-center d-none d-md-flex px-20">
        <CompaniesList {...{ catalogo }} />
      </Row>
      <Row className="justify-content-center align-items-center d-md-none w-100 mx-auto">
        <CarouselRow
          className="w-75"
          slidesToShow={3}
          infinite
          dots={false}
          slidesToShowResp={1.68}
          centerMode
        >
          {catalogo.map((e, i) => (
            <Col
              key={i}
              className="justify-content-center align-items-center"
              style={{
                overflow: 'hidden'
              }}
            >
              <img
                className="w-100"
                src={`/assets/static/img/logos/clientes-ht-${i + 1}.png`}
                alt="client"
              />
            </Col>
          ))}
        </CarouselRow>
      </Row>
    </div>
  )
}

export default CompaniesSection

CompaniesSection.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    subtitle: PropTypes.string.isRequired
  })
}
