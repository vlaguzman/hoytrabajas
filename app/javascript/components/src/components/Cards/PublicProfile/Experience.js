import React from 'react'
import PropTypes from 'prop-types'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import CarouselRow from '../../Carousel/CarouselRow'

const formatDate = (date) => {
  let dateTranform = new Date(date)
  return format(dateTranform, 'MMMM yyyy', { locale: es })
}

const defaultTranslations = {
  responsibilities: 'Responsabilidades',
  still_in_progress: 'En curso'
}

const Experience = ({
  defaultList,
  translations = defaultTranslations
}) => (
  <div className="m-experienceCards">
    <CarouselRow slidesToShow={2} autoplay={false}>
      {defaultList.map(item => (
        <div className="pt-20 h-100">
          <div className="d-flex flex-column a-shadow__card p-20 h-100 m-boxSmallInformation singleCard">
            <p className="a-typo__body1 fw-bolder m-0 titleCardExperience">{item.work_position}</p>
            <div className="companyWithDate">
              <span className="a-typo__body2 fw-bold color__blue-main titleCompany">
                {item.company_name}
              </span>
              <span className="a-experienceCard__date fw-bold color__gray-main dateExperience">
                {formatDate(item.started_at)} -{' '}
                {item.still_in_progress
                  ? translations.still_in_progress
                  : formatDate(item.finished_at)}
              </span>
            </div>
            {/* #TODO This is done because no responsibilities are not associated with work experience.
              item.responsibilities && item.responsibilities.length > 0 && (
                <>
                  <p className="a-typo__caption m-0 mt-5 fw-bold titleResponsibilities">
                    {translations.responsibilities}
                  </p>
                  <div className="flex-wrap justify-content-start my-10">
                    {item.responsibilities.map(resp => (
                      <span className="a-chip__gray d-inline-flex mr-5 a-skill">
                        {resp}
                      </span>
                    ))}
                  </div>
                </>
              )
            */}
            <div>
              <span className="a-chip__orange d-inline-flex jobCategory a-typo__caption fw-bold color__blue-main fw-bold a-skill color-orange">
                {item.job_category}
              </span>
            </div>
          </div>
        </div>
      ))}
    </CarouselRow>
  </div>
)

export default Experience

Experience.propTypes = {
  defaultList: PropTypes.arrayOf(
    PropTypes.shape({
      company_name: PropTypes.string.isRequired,
      work_position: PropTypes.string.isRequired,
      job_category: PropTypes.string.isRequired,
      responsibilities: PropTypes.arrayOf(PropTypes.string),
      started_at: PropTypes.object,
      finished_at: PropTypes.object,
      still_in_progress: PropTypes.bool
    })
  ).isRequired,
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    still_in_progress: PropTypes.string.isRequired
  }).isRequired
}
