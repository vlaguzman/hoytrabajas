import React, { useEffect } from 'react'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import PaperHeader from '../components/PaperHeader'
import { FormProvider } from '../context/formContext'
// import { InfoProvider } from '../context/formInfoContext'
import FormBody from '../forms/sections/FormBody'
import allForms from '../forms/formJson'

const SecondSection = () => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }

  const basicInfo = allForms.filter(form => form.formSection === 'basic_info')

  return (
    <Row className="my-50 justify-content-center w-100" noGutters>
      <Paper
        style={{ borderRadius: '16px' }}
        className="d-flex flex-column p-25 responsive-papers-entpr justify-content-center align-items-center"
      >
        <PaperHeader titulo="Datos de tu empresa" />
        <Row className="justify-content-center w-100 mx-50 " noGutters>
          <FormProvider singleForm={basicInfo}>
            <FormBody scrollAction={scrollTop} {...{ history }} />
          </FormProvider>
        </Row>
      </Paper>
    </Row>
  )
}

export default SecondSection
