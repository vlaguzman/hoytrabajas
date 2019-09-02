import React from 'react'
import Paper from '@material-ui/core/Paper'

const Body = ({ children }) => {
  return (
    <Paper className="d-flex flex-column w-80 justify-content-around align-items-center pt-60">
      {children}
    </Paper>
  )
}

export default Body
