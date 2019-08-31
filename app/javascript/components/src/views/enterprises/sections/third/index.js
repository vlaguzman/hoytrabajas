import React from 'react'
import Paper from '@material-ui/core/Paper'
import { Row } from 'reactstrap'
import PaperHeader from 'Components/PaperHeader'
import { FormProvider } from 'Context/formContext'

// // utilizar rutas absolutas para importar
import FormBody from 'Views/enterprises/sections/forms/sections/FormBody'
import allForms from 'Views/enterprises/sections/forms/formJson'

const ThirdSection = () => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }

  const aboutCompany = allForms.filter(
    form => form.formSection === 'about_company'
  )

  return (
    <Row className="my-50 justify-content-center w-100 px-20" noGutters>
      <Paper
        style={{ borderRadius: '16px' }}
        className="d-flex flex-column p-25 responsive-papers-entpr justify-content-center align-items-center"
      >
        <PaperHeader titulo="Háblanos de tu empresa" />
        <Row className="justify-content-center w-100 mx-50 " noGutters>
          <FormProvider formName="offers" singleForm={aboutCompany}>
            <FormBody scrollAction={scrollTop} />
          </FormProvider>
        </Row>
      </Paper>
    </Row>
  )
}

export default ThirdSection
