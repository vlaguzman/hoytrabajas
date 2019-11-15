import React from 'react'
import PropTypes from 'prop-types'
import { DynamicUsersProfile } from '../../../src/views/DynamicViews'
import AppLayout from '../../../src/components/Layout/AppLayout'

const formInfo = {
  basic_info: {
    edit_path: '/users/wizard/step_one',
    fields: {
      name: {
        current_value: 'Luis'
      },
      last_name: {
        current_value: 'González'
      },
      __contact_number: {
        current_value: '45646-41654'
      },
      __email: {
        current_value: 'user_email@hoytrabajas.com'
      },
      __location: {
        current_value: 'Bogotá, Colombia'
      }
    }
  },
  about_user: {
    edit_path: '/users/wizard/step_two',
    fields: {
      user_history: {
        current_value:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore orem ipsum dolor sit Lorem ipsum dolor sit amet, consectet… ver más'
      },
      __sex: {
        label: 'Sexo',
        current_value: 'Hombre'
      },
      __special_condition: {
        label: 'Tienes alguna condición especial',
        current_value: 'Física/Movilidad'
      },
      __education_level: {
        label: 'Nivel de educación',
        current_value: 'Técnico/Tecnólogo'
      },
      __job_situation: {
        label: 'Situación laboral actual',
        current_value: 'Desempleado'
      },
      __vehicles: {
        label: 'Cuentas con vehículos',
        current_value: 'Moto'
      },
      __licenses: {
        label: 'Licencia de conducción tipo',
        current_value: '1Categoría'
      }
    }
  },
  user_interests: {
    edit_path: '/users/wizard/step_three',
    fields: {
      __categories: {
        label: 'Categorías',
        current_value: 'Ventas, Marketing, Diseño'
      },
      __city: {
        label: 'Búsqueda en',
        current_value: 'Bogotá - Suba'
      },
      __legal_agreement: {
        label: 'Acuerdo legal',
        current_value: 'Termino indefinido'
      },
      __job_type: {
        label: 'Modalidad de trabajo',
        current_value: 'Teletrabajo/Remoto'
      },
      __job_days: {
        label: 'Disponibilidad',
        current_value: 'Lunes a viernes - Fines de semana'
      },
      __working_hours: {
        label: 'Franja horaria',
        current_value: 'Mañana 7am-1pm'
      },
      __salary: {
        label: 'Aspiración salarial',
        current_value: 'COP 750.000 a 1.200.000'
      }
    }
  },
  skills: {
    editPath: '/users/wizard/step_five',
    soft_skills: {
      list: [
        { label: 'Honestidad', value: 9 },
        { label: 'Responsabilidad', value: 6 },
        { label: 'Empatía', value: 3 }
      ]
    },
    technical_skills: {
      list: [
        {
          name: 'Coach',
          category: 'Recursos humanos',
          level: 'Principiante',
          validated_by: 9
        },
        {
          name: 'Desarrollador',
          category: 'Tecnología y programación',
          level: 'Intermedio',
          validated_by: 3
        },
        {
          name: 'Redes sociales',
          category: 'Marketing y ventas',
          level: 'Avanzado',
          validated_by: 6
        }
      ]
    },
    other_skills: {
      list: [
        'Redes sociales',
        'Analitica web',
        'Programación web',
        'Traducción'
      ]
    },
    languages: {
      list: [
        { label: 'Español', value: 'Lengua nativa' },
        { label: 'Inglés', value: 'Avanzado' },
        { label: 'Francés', value: 'Básico' }
      ]
    }
  },
  experience: {
    editPath: '/users/wizard/step_seven',
    list: [
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
  },
  education: {
    education_degrees: {
      editPath: '/users/wizard/step_eight',
      list: [
        {
          degree: 'Auxiliar de impresión',
          institution_name: 'Sena',
          city_id: 'Bucaramanga',
          start_date: new Date(1995, 6, 2),
          finish_date: new Date(2005, 6, 2),
          ongoing_study: ''
        },
        {
          degree: 'Curso de impresión Offset',
          institution_name: 'Sena',
          city_id: 'Bucaramanga',
          start_date: new Date(2005, 3, 11),
          finish_date: new Date(2008, 2, 12),
          ongoing_study: ''
        },
        {
          degree: 'Bachiller académico',
          institution_name: 'Don Bosco',
          city_id: 'Bogotá',
          start_date: new Date(2012, 1, 6),
          finish_date: '',
          ongoing_study: true
        },
        {
          degree: 'Bachiller académico',
          institution_name: 'Don Bosco',
          city_id: 'Bogotá',
          start_date: new Date(2016, 5, 10),
          finish_date: '',
          ongoing_study: true
        }
      ]
    },
    education_diplomas: {
      editPath: '/users/wizard/step_nine',
      list: [
        {
          title: 'Bartender',
          institution: 'Instituto nacional de bartenders',
          start_date: new Date(2016, 5, 10)
        },
        {
          title: 'Diplomado de oratoria',
          institution: 'Universidad de Buenos Aires',
          start_date: new Date(2018, 5, 10)
        }
      ]
    }
  }
}

const UsersProfilePage = props => {
  const {
    csrf_param,
    csrf_token,
    user_signed_in,
    company_signed_in,
    log_out_user,
    log_out_companies,
    session_translation
  } = props
  return (
    <AppLayout
      csrf_param={csrf_param}
      csrf_token={csrf_token}
      user_signed_in={user_signed_in}
      company_signed_in={company_signed_in}
      log_out_user={log_out_user}
      log_out_companies={log_out_companies}
      session_translation={session_translation}
    >
      <DynamicUsersProfile formInfo={formInfo} {...props} />
    </AppLayout>
  )
}

export default UsersProfilePage

UsersProfilePage.propTypes = {
  log_out_companies: PropTypes.string.isRequired,
  company_signed_in: PropTypes.bool.isRequired,
  user_signed_in: PropTypes.bool.isRequired,
  log_out_user: PropTypes.string.isRequired,
  csrf_param: PropTypes.string.isRequired,
  csrf_token: PropTypes.string.isRequired,
  session_translation: PropTypes.object.isRequired
}
