import React, { createContext, useReducer } from 'react'
// eslint-disable-next-line
import formInfoReducer from 'Reducers/formInfoReducer'

export const defaultInfo = {
  basic_info: {
    name: '',
    last_name: '',
    nationality: '',
    document: '',
    document_number: '',
    area_code: '',
    phone: ''
  },
  about_user: {
    history: '',
    job_categories: [],
    special_condition: '',
    genre: '',
    education_level: ''
  },
  job_info: {
    job_offer: '',
    job_contract: '',
    work_methodology: '',
    job_availability: '',
    job_city: '',
    job_location: ''
  },
  job_offer: {
    days_available: [],
    working_hours: [],
    currency: '',
    min_salary: '',
    max_salary: '',
    salary_interval: '',
    vehicle: '',
    driver_license: ''
  },
  skills: {
    primary_skills: [],
    technical_skills: [
      {
        id: null,
        skill_name: '',
        skill_category: '',
        skill_proficiency: ''
      }
    ],
    other_skills: [
      {
        id: null,
        skill_category: '',
        skill_name: ''
      }
    ],
    languages: [
      {
        id: null,
        language_name: '',
        language_proficiency: ''
      }
    ]
  },
  experiences: [
    {
      id: null,
      job_category: '',
      company: '',
      position: '',
      work_methodology: '',
      type_of_contract: '',
      started_at: '',
      finished_at: '',
      still_in_progress: '',
      roles: []
    }
  ],
  education: [
    {
      id: null,
      title: '',
      school: '',
      started_at: '',
      finished_at: '',
      still_in_progress: '',
      location: '',
      file: ''
    }
  ],
  diplomas: [
    {
      id: null,
      title: '',
      school: '',
      started_at: '',
      file: ''
    }
  ]
}

export const InfoContext = createContext()
export const DispatchInfoContext = createContext()

export const InfoProvider = props => {
  const [infoState, dispatch] = useReducer(formInfoReducer, defaultInfo)
  return (
    <InfoContext.Provider value={infoState}>
      <DispatchInfoContext.Provider value={dispatch}>
        {props.children}
      </DispatchInfoContext.Provider>
    </InfoContext.Provider>
  )
}
