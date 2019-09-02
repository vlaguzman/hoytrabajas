import React, { Fragment } from 'react'
import Typography from '@material-ui/core/Typography'

const DragNDrop = () => {
  return (
    <Fragment>
      <div
        className="w-100 p-20 d-flex justify-content-center"
        style={{ border: '1px dashed #EBEDF2' }}
      >
        <i className="ti-files mr-20 text-muted" style={{ fontSize: '3rem' }} />
        <div className="text-center w-50">
          <Typography variant="caption">
            Arrastra aquí el documento ó imagen
          </Typography>
          <Typography variant="caption">
            <small style={{ color: '#64CBD3' }}>
              ó búscala en tu ordenador
            </small>
          </Typography>
        </div>
      </div>
    </Fragment>
  )
}

export default DragNDrop
