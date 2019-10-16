import React from 'react'
import Loadable from 'react-loadable'
import Loading from '../components/Layout/Loading'

/* MAIN */

export const DynamicHome = Loadable({
  loader: () => import('./main/home'),
  loading: Loading
})

/* OFFERS */

export const DynamicOffers = Loadable({
  loader: () => import("./offers"),
  loading: Loading
})

export const DynamicOffersForms = Loadable({
  loader: () => import('./offers/forms'),
  loading: Loading
})

export const DynamicOffersSteps = Loadable({
  loader: () => import('./offers/forms'),
  loading: Loading
})

export const DynamicOffersCompleted = Loadable({
  loader: () => import('./offers/forms/completed'),
  loading: Loading
})

/* COMPANIES */

export const DynamicCompaniesStepZero = Loadable({
  loader: () => import('./companies/first_offer/step_zero'),
  loading: Loading
})
export const DynamicCompaniesStepOne = Loadable({
  loader: () => import('./companies/first_offer/step_one'),
  loading: Loading
})

/* REGCAN */

export const DynamicReg = Loadable({
  loader: () => import('./regcan'),
  loading: Loading
})
export const DynamicRegForms = Loadable({
  loader: () => import('./regcan/forms'),
  loading: Loading
})
export const DynamicFormsCompleted = Loadable({
  loader: () => import('./regcan/forms/completed'),
  loading: Loading
})

/* ENTERPRISES */

export const DynamicEnterprises = Loadable({
  loader: () => import('./enterprises'),
  loading: Loading
})

/* USERS */

export const DynamicUsersProfile = Loadable({
  loader: () => import('./users/profile'),
  loading: Loading
})

export const DynamicUsersChooseRole = Loadable({
  loader: () => import('./users/selectRole'),
  loading: Loading
})

/** Users Wizards Steps */

export const DynamicUsersWizardsStepOne = Loadable({
  loader: () => import('./users/wizards/step_ones/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepTwo = Loadable({
  loader: () => import('./users/wizards/step_twos/show'),
  loading: Loading
})

/* Dashboards */

export const DynamicBoards = Loadable({
  loader: () => import('./dashboards'),
  loading: Loading
})
export const DynamicBoardsEnterprises = Loadable({
  loader: () => import('./dashboards/enterprises'),
  loading: Loading
})

// Detalle oferta
export const DynamicDetalle = Loadable({
  loader: () => import('./detalle_oferta'),
  loading: Loading
})

/* Validations */

export const DynamicValidations = Loadable({
  loader: () => import('./validations'),
  loading: Loading
})

/*Edicion oferta */

export const DynamicOfferEdit = Loadable({
  loader: () => import('./edicion_oferta'),
  loading: Loading
})

/*Busqueda oferta */

export const DynamicSearch = Loadable({
  loader: () => import('./search'),
  loading: Loading
})
