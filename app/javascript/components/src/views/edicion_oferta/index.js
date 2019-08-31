import React, {Fragment} from 'react'
import Head from 'next/head'
import { Row } from 'reactstrap'
import EditForm from 'Components/FormsLayout/EditForm'
import allForms from 'Views/edicion_oferta/sections/forms/formJson'

const EditOffersPage = () => {
  return (
    <Fragment>
        <Head>
          <title>Edición de oferta</title>
          <meta name="description" content="HoyTrabajas Enterprise Dashboard" />
        </Head>
        <Row style={{ background: 'white', height: '5rem' }} />
        <Row
          className="position-relative"
          style={{ background: 'white', height: '17rem' }}
        >
          <div
            className="position-absolute w-100"
            style={{ background: '#fff9e4', height: '22rem' }}
          />
        </Row>
      <div className="edicion-oferta-wrapper pcx">
        {allForms.map((item, idx) => {
          const chipContent = (idx === 0 && 'Ver mi oferta') || null

          return (
            <EditForm
              chipContent={chipContent}
              title={item.editTitle}
              form={[item]}
              formName="offers"
            />
          )
        })}
      </div>

    </Fragment>
  )
}

export default EditOffersPage
