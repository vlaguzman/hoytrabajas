import React from 'react'
import { DynamicCompaniesStepTwo } from '../../../../../src/views/DynamicViews'
import AppLayout from '../../../../../src/components/Layout/AppLayout'

const CompaniesStepTwoPage = (props) => {

  const {csrf_param, csrf_token, user_signed_in, company_signed_in, log_out_user, log_out_companies} = props

  return (
    <AppLayout
      csrf_param        = {csrf_param}
      csrf_token        = {csrf_token}
      user_signed_in    = {user_signed_in}
      company_signed_in = {company_signed_in}
      log_out_user      = {log_out_user}
      log_out_companies = {log_out_companies} >

      <DynamicCompaniesStepTwo {...props} />
    </AppLayout>
  )
}

export default CompaniesStepTwoPage
