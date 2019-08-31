import React from 'react'
import Paper from '@material-ui/core/Paper'
import {Row} from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import PaperHeader from '../components/PaperHeader';
// import { FormProvider } from '../context/formContext'
// import { InfoProvider } from '../context/formInfoContext'
// import FormBody from '../forms/sections/FormBody'
// import allForms from '../forms/formJson'


const FourthSection = () => {
  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }
  return (
    <Row className="my-50 justify-content-center w-100" noGutters>
      <Paper style={{borderRadius: '16px'}} className="d-flex flex-column p-25 responsive-papers-entpr justify-content-center align-items-center">
        <PaperHeader titulo='Persona de contacto'/>
        <Row className="justify-content-center w-100 mx-50 " noGutters>
          {/* <FormProvider allForms={allForms.slice(2)}>
            <InfoProvider>
                <FormBody scrollAction={scrollTop} {...{ history }} />
            </InfoProvider>
          </FormProvider> */}
        </Row>
      </Paper>
    </Row>
  )
}

export default FourthSection