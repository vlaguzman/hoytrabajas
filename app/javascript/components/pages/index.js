import React from 'react'
import { DynamicHome } from '../src/views/DynamicViews'
import AppLayout from '../src/components/Layout/AppLayout'

const HomePage = ( { offers, csrf_param, csrf_token, user_signed_in } ) => {
  console.log("estoy en el index", user_signed_in)
  return(
  <div className="main-wrapper">
    <AppLayout csrf_param = {csrf_param} csrf_token={csrf_token} user_signed_in={user_signed_in}>
      <DynamicHome offers = { offers }  />
    </AppLayout>
  </div>
)
}
export default HomePage
