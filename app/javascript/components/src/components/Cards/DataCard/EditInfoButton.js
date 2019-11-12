import React from 'react'
import PropTypes from 'prop-types'
import AddCircleOutline from '@material-ui/icons/AddCircleOutline'
import Typography from '@material-ui/core/Typography'
import Fab from '@material-ui/core/Fab'

const EditInfoButton = ({ text, lastUpdate, editPath }) => (
  <>
    {lastUpdate && (
      <div>
        <Typography
          className="text-muted"
          variant="caption"
          style={{ lineHeight: '1.7rem' }}
        >{`Última actualización: Hace ${lastUpdate} `}</Typography>
      </div>
    )}
    <Fab
      href={editPath}
      variant="extended"
      style={{ boxShadow: 'none', backgroundColor: 'transparent', padding: 0 }}
    >
      <AddCircleOutline color="primary" className="mr-10" />
      <Typography
        color="primary"
        variant="body2"
        style={{
          lineHeight: '1.7rem',
          textDecoration: 'underline',
          textTransform: 'none',
          fontWeight: 'bold'
        }}
      >
        {text}
      </Typography>
    </Fab>
  </>
)

export default EditInfoButton

EditInfoButton.propTypes = {
  text: PropTypes.string.isRequired,
  lastUpdate: PropTypes.string,
  editPath: PropTypes.string.isRequired
}
