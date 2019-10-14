import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ( { offers, csrf_param, csrf_token, user_signed_in, log_out_user } ) => {
  console.log("estoy en el index", user_signed_in)
  console.log("estp es lo que imprime el coso: ", `${log_out_user}`)
  return(
  <div className="main-wrapper">
    <AppLayout csrf_param = {csrf_param} csrf_token={csrf_token} user_signed_in={user_signed_in} log_out_user={log_out_user} >
      <DynamicHome offers = { offers }  />
    </AppLayout>
  </div>
)
}
export default HomePage
