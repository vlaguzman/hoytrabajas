export default {
  offers: {
    basic_info: {
      name: '',
      sector: '',
      contact_person: '',
      role: '',
      area_code: '57',
      phone: '',
      number_of_employees: '',
      email: '',
      address: '',
      location: '',
      nit: '',
      website: '',
      validation: {
        name: {
          isRequired: true,
          errorMessage: ''
        },
        sector: {
          isRequired: true,
          errorMessage: ''
        },
        contact_person: {
          isRequired: false,
          errorMessage: ''
        },
        role: {
          isRequired: false,
          errorMessage: ''
        },
        area_code: {
          isRequired: true,
          errorMessage: ''
        },
        phone: {
          isRequired: true,
          errorMessage: ''
        },
        number_of_employees: {
          isRequired: false,
          errorMessage: ''
        },
        email: {
          isRequired: false,
          errorMessage: ''
        },
        address: {
          isRequired: false,
          errorMessage: ''
        },
        location: {
          isRequired: true,
          errorMessage: ''
        },
        nit: {
          isRequired: true,
          errorMessage: ''
        },
        website: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    about_company: {
      history: '',
      validation: {
        history: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    offer_info: {
      offer_title: '',
      offer_category: '',
      offer_role: [],
      offer_type: '',
      work_methodology: '',
      validation: {
        offer_title: {
          isRequired: true,
          errorMessage: ''
        },
        offer_category: {
          isRequired: true,
          errorMessage: ''
        },
        offer_role: {
          isRequired: false,
          errorMessage: ''
        },
        offer_type: {
          isRequired: true,
          errorMessage: ''
        },
        work_methodology: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    offer_details: {
      legal_agreement: '',
      vacancies: '',
      offer_genre: '',
      offer_age: '',
      expires_at: '',
      start_at: '',
      validation: {
        legal_agreement: {
          isRequired: true,
          errorMessage: ''
        },
        vacancies: {
          isRequired: false,
          errorMessage: ''
        },
        offer_genre: {
          isRequired: false,
          errorMessage: ''
        },
        offer_age: {
          isRequired: false,
          errorMessage: ''
        },
        expires_at: {
          isRequired: true,
          errorMessage: ''
        },
        start_at: {
          isRequired: true,
          errorMessage: ''
        }
      }
    },
    offer_logistics: {
      type_range: '',
      currency: '',
      min_salary: '',
      max_salary: '',
      salary_interval: '',
      required_days: [],
      working_hours: [],
      benefits: [],
      validation: {
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
        },
        required_days: {
          isRequired: false,
          errorMessage: ''
        },
        working_hours: {
          isRequired: false,
          errorMessage: ''
        },
        benefits: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    offer_requirements: {
      responsabilities: [],
      requirements: [],
      vehicle: [],
      license: [],
      validation: {
        responsabilities: {
          isRequired: true,
          errorMessage: ''
        },
        requirements: {
          isRequired: false,
          errorMessage: ''
        },
        vehicle: {
          isRequired: false,
          errorMessage: ''
        },
        license: {
          isRequired: false,
          errorMessage: ''
        }
      }
    },
    employee_profile: {
      offer_city: '',
      education_level: '',
      minimal_experience: {
        number: '',
        type_of_unit: '',
        without_experience: false
      },
      required_skills: [
        {
          skills: [],
          skill_proficiency: ''
        }
      ],
      required_languages: [
        {
          languages: [],
          language_proficiency: ''
        }
      ],
      validation: {
        offer_city: {
          isRequired: true,
          errorMessage: ''
        },
        education_level: {
          isRequired: false,
          errorMessage: ''
        },
        minimal_experience: {
          isRequired: false,
          errorMessage: ''
        },
        skills: {
          isRequired: false,
          errorMessage: ''
        },
        languages: {
          isRequired: false,
          errorMessage: ''
        }
      }
    }
  }
}
