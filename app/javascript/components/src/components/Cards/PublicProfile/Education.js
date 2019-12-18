import React from 'react'
import Divider from '@material-ui/core/Divider'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import CarouselRow from '../../Carousel/CarouselRow'

const formatDate = date => format(date, 'MMMM yyyy', { locale: es })

const list = [
  {
    title: 'Comunicador social',
    institution_name: 'Universidad autónoma de Colombia',
    city_id: 'Bucaramanga, Santander',
    start_date: new Date(1995, 6, 2),
    finish_date: null,
    ongoing_study: true
  },
  {
    title: 'Auxiliar de impresión',
    institution_name: 'Sena',
    city_id: 'Bucaramanga',
    start_date: new Date(1995, 6, 2),
    finish_date: new Date(2005, 6, 2),
    ongoing_study: ''
  },
  {
    title: 'Curso de impresión Offset',
    institution_name: 'Sena',
    city_id: 'Bucaramanga',
    start_date: new Date(2005, 3, 11),
    finish_date: new Date(2008, 2, 12),
    ongoing_study: ''
  },
  {
    title: 'Bachiller académico',
    institution_name: 'Don Bosco',
    city_id: 'Bogotá',
    start_date: new Date(2012, 1, 6),
    finish_date: '',
    ongoing_study: true
  },
  {
    title: 'Bachiller académico',
    institution_name: 'Don Bosco',
    city_id: 'Bogotá',
    start_date: new Date(2016, 5, 10),
    finish_date: '',
    ongoing_study: true
  }
]

const Education = () => (
  <div className="m-educationCards mt-60">
    <CarouselRow slidesToShow={2} autoplay={false}>
      {list.map(item => (
        <div className="pt-20 h-100">
          <div className="d-flex flex-column mx-20 a-shadow__card p-20 h-100">
            <div className="d-flex">
              <div className="a-educationCard__title">
                <p className="a-typo__body1 fw-bolder m-0">{item.title}</p>
                <p className="a-typo__body2 fw-bold color__blue-main">
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
            <p className="a-typo__caption fw-bold">{item.city_id}</p>
            <Divider className="mt-auto" />
            <p className="a-educationCard__date a-typo__caption mt-10 fw-bold color__blue-main">
              {formatDate(item.start_date)} -{' '}
              {item.ongoing_study
                ? 'Estudio en curso'
                : formatDate(item.finish_date)}
            </p>
          </div>
        </div>
      ))}
    </CarouselRow>
  </div>
)

export default Education
