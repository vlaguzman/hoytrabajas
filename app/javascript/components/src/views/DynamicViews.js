import Loadable from 'react-loadable'
import Loading from '../components/Layout/Loading'

/* MAIN */

export const DynamicHome = Loadable({
  loader: () => import('./main/home'),
  loading: Loading
})

/* OFFERS */

export const DynamicOffers = Loadable({
  loader: () => import('./offers'),
  loading: Loading
})

/* COMPANIES */

export const DynamicCompaniesStepZero = Loadable({
  loader: () => import('./companies/first_offer/step_zero'),
  loading: Loading
})
export const DynamicCompaniesStepOne = Loadable({
  loader: () => import('./companies/first_offer/step_ones/show'),
  loading: Loading
})

export const DynamicCompaniesStepTwo = Loadable({
  loader: () => import('./companies/first_offer/step_twos/show'),
  loading: Loading
})

export const DynamicCompaniesStepThree = Loadable({
  loader: () => import('./companies/first_offer/step_threes/new'),
  loading: Loading
})

export const DynamicCompaniesStepFour = Loadable({
  loader: () => import('./companies/first_offer/step_fours/edit'),
  loading: Loading
})
export const DynamicCompaniesStepFive = Loadable({
  loader: () => import('./companies/first_offer/step_five'),
  loading: Loading
})
export const DynamicCompaniesStepSix = Loadable({
  loader: () => import('./companies/first_offer/step_six'),
  loading: Loading
})
export const DynamicCompaniesStepSeven = Loadable({
  loader: () => import('./companies/first_offer/step_seven'),
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

export const DynamicUsersWizardsStepThree = Loadable({
  loader: () => import('./users/wizards/step_threes/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepFour = Loadable({
  loader: () => import('./users/wizards/step_fours/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepFive = Loadable({
  loader: () => import('./users/wizards/step_fives/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepSix = Loadable({
  loader: () => import('./users/wizards/step_sixes/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepSeven = Loadable({
  loader: () => import('./users/wizards/step_sevens/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepEight = Loadable({
  loader: () => import('./users/wizards/step_eights/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepNine = Loadable({
  loader: () => import('./users/wizards/step_nines/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepTen = Loadable({
  loader: () => import('./users/wizards/step_tens/show'),
  loading: Loading
})

export const DynamicUsersWizardsStepEleven = Loadable({
  loader: () => import('./users/wizards/step_elevens/show'),
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

/* Edicion oferta */

export const DynamicOfferEdit = Loadable({
  loader: () => import('./edicion_oferta'),
  loading: Loading
})

/* Busqueda oferta */

export const DynamicSearch = Loadable({
  loader: () => import('./search'),
  loading: Loading
})
