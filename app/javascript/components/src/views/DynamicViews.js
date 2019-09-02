import React from 'react'
import dynamic from 'next/dynamic'
import Loading from '../components/Layout/Loading'

/* MAIN */

export const DynamicHome = dynamic(() => import('../views/main/home'), {
  loading: () => <Loading />
})


/* OFFERS */

export const DynamicOffers = dynamic(() => import('../views/offers/'), {
  loading: () => <Loading />
})
export const DynamicOffersForms = dynamic(() => import('../views/offers/forms'), {
  loading: () => <Loading />
})


export const DynamicOffersCompleted = dynamic(
  () => import('../views/offers/forms/completed'),
  {
    loading: () => <Loading />
  }
)

/* REGCAN */


export const DynamicReg = dynamic(() => import('../views/regcan/'), {
  loading: () => <Loading />
})
export const DynamicRegForms = dynamic(() => import('../views/regcan/forms'), {
  loading: () => <Loading />
})
export const DynamicFormsCompleted = dynamic(
  () => import('../views/regcan/forms/completed'),
  {
    loading: () => <Loading />
  }
)
/* CROF */

export const DynamicCrofMain = dynamic(() => import('../views/crof/main'), {
  loading: () => <Loading />
})


/* ENTERPRISES */

export const DynamicEnterprises = dynamic(() => import('../views/enterprises'), {
  loading: () => <Loading />
})

/* USERS */


export const DynamicUsersProfile = dynamic(
  () => import('../views/users/profile'),
  {
    loading: () => <Loading />
  }
)
export const DynamicUsersChooseRole = dynamic(
  () => import('../views/users/selectRole'),
  {
    loading: () => <Loading />
  }
)

/* Dashboards */

export const DynamicBoards = dynamic(() => import('../views/dashboards'), {
  loading: () => <Loading />
})
export const DynamicBoardsEnterprises = dynamic(
  () => import('../views/dashboards/enterprises'),
  {
    loading: () => <Loading />
  }
)

// Detalle oferta
export const DynamicDetalle = dynamic(
  () => import('../views/detalle_oferta'),
  {
    loading: () => <Loading />
  }
)

/* Validations */

export const DynamicValidations = dynamic(
  () => import('../views/validationsPage'),
  {
    loading: () => <Loading />
  }
)

/*Edicion oferta*/

export const DynamicOfferEdit = dynamic(
  () => import('../views/edicion_oferta'),
  {
    loading: () => <Loading />
  }
)

/*Busqueda oferta*/

export const DynamicSearch = dynamic(
  () => import('../views/search'),
  {
    loading: () => <Loading />
  }
)
