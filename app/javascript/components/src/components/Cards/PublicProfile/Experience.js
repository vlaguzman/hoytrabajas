import React from 'react'
import { es } from 'date-fns/locale'
import { format } from 'date-fns'
import Chip from '@material-ui/core/Chip'
import CarouselRow from '../../Carousel/CarouselRow'

const formatDate = date => format(date, 'MMMM yyyy', { locale: es })

const list = [
  {
    company_name: 'CineColombia',
    work_position: 'Community Manager',
    job_category: 'Marketing',
    responsibilities: ['Redes sociales', 'Diseño gráfico', 'Publicidad'],
    started_at: new Date(1995, 6, 2),
    finished_at: new Date(2000, 8, 5),
    still_in_progress: ''
  },
  {
    company_name: 'Bancolombia',
    work_position: 'Gerente de operaciones',
    job_category: 'Administración',
    responsibilities: ['Contaduría', 'Supervisión', 'Inventario'],
    started_at: new Date(2008, 9, 1),
    finished_at: new Date(2010, 3, 3),
    still_in_progress: ''
  },
  {
    company_name: 'Rappi',
    work_position: 'Repartidor',
    job_category: 'Utility',
    responsibilities: ['Conductor'],
    started_at: new Date(2016, 12, 2),
    finished_at: '',
    still_in_progress: true
  },
  {
    company_name: "McDonald's",
    work_position: 'Operador telefónico',
    job_category: 'Atención al cliente',
    responsibilities: ['Operador'],
    started_at: new Date(2018, 8, 10),
    finished_at: '',
    still_in_progress: true
  }
]

const Experience = () => (
  <div className="m-experienceCards mt-60">
    <CarouselRow slidesToShow={2} autoplay={false}>
      {list.map(item => (
        <div className="pt-20 h-100">
          <div className="d-flex flex-column mx-20 a-shadow__card p-20 h-100">
            <p className="a-typo__body1 fw-bolder m-0">{item.work_position}</p>
            <div className="companyWithDate">
              <span className="a-typo__body2 fw-bold color__blue-main">
                {item.company_name}
              </span>
              <span className="a-experienceCard__date fw-bold color__gray-main">
                {formatDate(item.started_at)} -{' '}
                {item.still_in_progress
                  ? 'Estudio en curso'
                  : formatDate(item.finished_at)}
              </span>
            </div>
            {item.responsibilities && item.responsibilities.length > 0 && (
              <>
                <p className="a-typo__caption m-0 mt-5 fw-bold">
                  Responsabilidades
                </p>
                <div className="flex-wrap justify-content-start my-10">
                  {item.responsibilities.map(resp => (
                    <span className="a-chip__gray d-inline-flex mr-5">
                      {resp}
                    </span>
                  ))}
                </div>
              </>
            )}
            <div>
              <span className="a-chip__orange d-inline-flex jobCategory a-typo__caption mt-10 fw-bold color__blue-main fw-bold">
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
