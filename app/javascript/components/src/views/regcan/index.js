import React from 'react'
import Cortinilla from './shared/Cortinilla'
import data from './data'

const RegPage = () => {

  return (
    <>
      <div className="d-flex my-50 justify-content-center w-100 pb-50 ">
        <Cortinilla redirectTo="/regcan/forms" {...data[0]} />
      </div>
    </>
  )
}

export default RegPage
