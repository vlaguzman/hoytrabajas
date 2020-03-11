import React from 'react'
import PropTypes from 'prop-types'
import Divider from '@material-ui/core/Divider'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import CarouselRow from '../../Carousel/CarouselRow'

const formatDate = date => {
  const dateTranform = new Date(date)
  return format(dateTranform, 'MMMM yyyy', { locale: es })
}

const defaultTranslations = {
  ongoing_study: 'Estudio en curso'
}

const Education = ({ defaultList, translations = defaultTranslations }) => {
  return (
    <div className="m-educationCards">
      <CarouselRow slidesToShow={2} autoplay={false} centerModeResp={false}>
        {defaultList.map(item => (
          <div className="pt-20 h-100">
            <div className="d-flex flex-column a-shadow__card singleCard m-boxSmallInformation">
              <div className="d-flex">
                <div className="a-educationCard__title">
                  <p className="a-typo__body1 fw-bolder m-0 title">
                    {item.title}
                  </p>
                  <p className="a-typo__body2 fw-bold color__blue-main subtitle">
                    {item.institution_name}
                  </p>
                </div>
                <div className="a-educationCard__attachIcon">
                  <FontAwesomeIcon
                    className="mx-auto"
                    icon="paperclip"
                    size="md"
                  />
                </div>
              </div>
              <p className="a-typo__caption fw-bold infoCity">{item.city_id}</p>
              <Divider />
              <p className="a-educationCard__date a-typo__caption mt-10 fw-bold color__blue-main infoCity infoDates">
                {formatDate(item.start_date)} -{' '}
                {item.ongoing_study
                  ? translations.ongoing_study
                  : formatDate(item.finish_date)}
              </p>
            </div>
          </div>
        ))}
      </CarouselRow>
    </div>
  )
}

export default Education

Education.propTypes = {
  defaultList: PropTypes.arrayOf(
    PropTypes.shape({
      title: PropTypes.string.isRequired,
      institution_name: PropTypes.string.isRequired,
      city_id: PropTypes.string.isRequired,
      start_date: PropTypes.object,
      finish_date: PropTypes.object,
      ongoing_study: PropTypes.bool
    })
  ).isRequired,
  translations: PropTypes.shape({
    ongoing_study: PropTypes.string.isRequired
  }).isRequired
}
