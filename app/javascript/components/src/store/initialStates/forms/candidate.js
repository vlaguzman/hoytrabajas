export default {
  candidate: {
    basic_info: {
      name: '',
      last_name: '',
      nationality: '',
      document: '',
      document_number: '',
      area_code: '',
      phone: '',
      validation: {
        name: {
          isRequired: true,
          errorMessage: ''
        },
        last_name: {
          isRequired: true,
          errorMessage: ''
        },
        nationality: {
          isRequired: false,
          errorMessage: ''
        },
        document: {
          isRequired: false,
          errorMessage: ''
        },
        document_number: {
          isRequired: true,
          errorMessage: ''
        },
        area_code: {
          isRequired: true,
          errorMessage: ''
        },
        phone: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    about_user: {
      history: '',
      special_condition: '',
      genre: '',
      age: '',
      education_level: '',
      validation: {
        history: {
          isRequired: true,
          errorMessage: ''
        },
        special_condition: {
          isRequired: false,
          errorMessage: ''
        },
        genre: {
          isRequired: false,
          errorMessage: ''
        },
        age: {
          isRequired: false,
          errorMessage: ''
        },
        education_level: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    job_info: {
      job_categories: [],
      job_offer: '',
      legal_agreement: '',
      work_methodology: '',
      job_availability: '',
      job_city: '',
      validation: {
        job_categories: {
          isRequired: false,
          errorMessage: ''
        },
        job_offer: {
          isRequired: false,
          errorMessage: ''
        },
        legal_agreement: {
          isRequired: false,
          errorMessage: ''
        },
        work_methodology: {
          isRequired: false,
          errorMessage: ''
        },
        job_availability: {
          isRequired: false,
          errorMessage: ''
        },
        job_city: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    job_location: {
      job_state: '',
      work_other_cities: false,
      job_city: '',
      job_location: [],
      vehicle: '',
      licenses: '',
      validation: {
        job_state: {
          isRequired: false,
          errorMessage: ''
        },
        work_other_cities: {
          isRequired: false,
          errorMessage: ''
        },
        job_city: {
          isRequired: false,
          errorMessage: ''
        },
        job_location: {
          isRequired: false,
          errorMessage: ''
        },
        vehicle: {
          isRequired: false,
          errorMessage: ''
        },
        licenses: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    job_offer: {
      days_available: [],
      working_hours: [],
      type_range: '',
      currency: '',
      min_salary: '',
      max_salary: '',
      salary_interval: '',
      validation: {
        days_available: {
          isRequired: false,
          errorMessage: ''
        },
        working_hours: {
          isRequired: false,
          errorMessage: ''
        },
        type_range: {
          isRequired: true,
          errorMessage: ''
        },
        currency: {
          isRequired: true,
          errorMessage: ''
        },
        min_salary: {
          isRequired: true,
          errorMessage: ''
        },
        max_salary: {
          isRequired: false,
          errorMessage: ''
        },
        salary_interval: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    skills: {
      primary_skills: [],
      technical_skills: [
        {
          id: null,
          skill_id: '',
          skill_name: '',
          skill_category: '',
          skill_proficiency: ''
        }
      ],
      other_skills: [
        {
          id: null,
          skill_category: '',
          skills: []
        }
      ],
      languages: [
        {
          id: null,
          language_id: '',
          language_proficiency: ''
        }
      ],
      validation: {
        primary_skills: {
          isRequired: true,
          errorMessage: ''
        },
        technical_skills: {
          isRequired: true,
          errorMessage: ''
        },
        other_skills: {
          isRequired: false,
          errorMessage: ''
        },
        languages: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    experiences: {
      fields: [
        {
          id: null,
          job_category: '',
          company: '',
          role: '',
          work_methodology: '',
          job_city: '',
          job_location: '',
          started_at: '',
          finished_at: '',
          still_in_progress: false,
          responsabilities: []
        }
      ],
      validation: {
        job_category: {
          isRequired: true,
          errorMessage: ''
        },
        company: {
          isRequired: false,
          errorMessage: ''
        },
        role: {
          isRequired: true,
          errorMessage: ''
        },
        work_methodology: {
          isRequired: false,
          errorMessage: ''
        },
        job_city: {
          isRequired: false,
          errorMessage: ''
        },
        job_location: {
          isRequired: false,
          errorMessage: ''
        },
        started_at: {
          isRequired: false,
          errorMessage: ''
        },
        finished_at: {
          isRequired: false,
          errorMessage: ''
        },
        still_in_progress: {
          isRequired: false,
          errorMessage: ''
        },
        responsabilities: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    education: {
      fields: [
        {
          id: null,
          title: '',
          school: '',
          started_at: '',
          finished_at: '',
          still_in_progress: false,
          location: '',
          file: ''
        }
      ],
      validation: {
        title: {
          isRequired: true,
          errorMessage: ''
        },
        school: {
          isRequired: false,
          errorMessage: ''
        },
        started_at: {
          isRequired: false,
          errorMessage: ''
        },
        finished_at: {
          isRequired: false,
          errorMessage: ''
        },
        still_in_progress: {
          isRequired: false,
          errorMessage: ''
        },
        location: {
          isRequired: false,
          errorMessage: ''
        },
        file: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    diplomas: {
      fields: [
        {
          id: null,
          title: '',
          school: '',
          started_at: '',
          file: ''
        }
      ],
      validation: {
        title: {
          isRequired: true,
          errorMessage: ''
        },
        school: {
          isRequired: false,
          errorMessage: ''
        },
        started_at: {
          isRequired: false,
          errorMessage: ''
        },
        file: {
          isRequired: false,
          errorMessage: ''
        }
      }
    }
  }
}
