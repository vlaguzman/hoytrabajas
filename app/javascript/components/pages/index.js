import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ( { offers, csrf_param, csrf_token, user_signed_in, company_signed_in, log_out_user log_out_companies } ) => {
  console.log("el usuario esta logueado?", user_signed_in)
  console.log("la empresa esta logueada?", company_signed_in)
  console.log("esta en la ruta para desloguear: ", `${log_out_user}`)
  console.log("esta en la ruta para desloguear: ", `${log_out_companies}`)
  return(
  <div className="main-wrapper">
    <AppLayout csrf_param = {csrf_param} csrf_token={csrf_token} user_signed_in={user_signed_in} company_signed_in={company_signed_in} log_out_user={log_out_user} log_out_companies={log_out_companies}>
      <DynamicHome offers = { offers }  />
    </AppLayout>
  </div>
)
}
export default HomePage
