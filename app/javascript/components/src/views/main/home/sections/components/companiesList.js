import React, { Fragment } from 'react'
import { Row, Col } from 'reactstrap'
import { map } from 'lodash'

const CompaniesList = ({ catalogo }) => {
  return (
    <Fragment>
      {
      map(catalogo,(e, i) => {
        return (
          <Col
            xs={12}
            key={i}
            className="justify-content-center align-items-center p-10 m-10"
            style={{
              maxWidth: '138.3px',
              maxHeight: '138.3',
              overflow: 'hidden'
            }}
          >
            <img
              className="rounded"
              src={`/assets/static/img/logos/clientes-ht-${i + 1}.jpg`}
              alt="client"
            />
          </Col>
        )
      })}
    </Fragment>
  )
}
export default CompaniesList
