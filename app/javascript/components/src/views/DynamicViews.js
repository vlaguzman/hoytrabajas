import React from 'react'
import dynamic from 'next/dynamic'
import Loading from '../components/Layout/Loading'
import Loadable from 'react-loadable'

/* MAIN */

export const DynamicHome = Loadable({
  loader: () => import('./main/home'),
  loading: Loading
})

/* OFFERS */

export const DynamicOffers = dynamic(() => import('./offers/'), {
  loading: () => <Loading />
})
export const DynamicOffersForms = dynamic(() => import('./offers/forms'), {
  loading: () => <Loading />
})


export const DynamicOffersCompleted = dynamic(
  () => import('./offers/forms/completed'),
  {
    loading: () => <Loading />
  }
)

/* REGCAN */


export const DynamicReg = dynamic(() => import('./regcan/'), {
  loading: () => <Loading />
})
export const DynamicRegForms = dynamic(() => import('./regcan/forms'), {
  loading: () => <Loading />
})
export const DynamicFormsCompleted = dynamic(
  () => import('./regcan/forms/completed'),
  {
    loading: () => <Loading />
  }
)


/* ENTERPRISES */

export const DynamicEnterprises = dynamic(() => import('./enterprises'), {
  loading: () => <Loading />
})

/* USERS */


export const DynamicUsersProfile = dynamic(
  () => import('./users/profile'),
  {
    loading: () => <Loading />
  }
)
export const DynamicUsersChooseRole = dynamic(
  () => import('./users/selectRole'),
  {
    loading: () => <Loading />
  }
)

/* Dashboards */

export const DynamicBoards = dynamic(() => import('./dashboards'), {
  loading: () => <Loading />
})
export const DynamicBoardsEnterprises = dynamic(
  () => import('./dashboards/enterprises'),
  {
    loading: () => <Loading />
  }
)

// Detalle oferta
export const DynamicDetalle = dynamic(
  () => import('./detalle_oferta'),
  {
    loading: () => <Loading />
  }
)

/* Validations */

export const DynamicValidations = dynamic(
  () => import('./validations'),
  {
    loading: () => <Loading />
  }
)

/*Edicion oferta*/

export const DynamicOfferEdit = dynamic(
  () => import('./edicion_oferta'),
  {
    loading: () => <Loading />
  }
)

/*Busqueda oferta*/

export const DynamicSearch = dynamic(
  () => import('./search'),
  {
    loading: () => <Loading />
  }
)
