import React from 'react'
import Unidad from './categoryUnit'

const categoriasList = elementsList =>
  elementsList.map((e, i) => (
    <div key={i} className="col-6 col-md-2 mb-10">
      <Unidad {...e} />
    </div>
  ))

export default ({ list }) => {
  return (
    <div className="row align-items-stretch justify-content-around w-100 mx-auto">
      {categoriasList(list)}
    </div>
  )
}
