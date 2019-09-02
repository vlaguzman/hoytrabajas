import react from 'react'
import Typography from '@material-ui/core/Typography'

const ProfileBasicInfo = ({ currentDataContent }) => {
  const ignoreFields = ['name', 'last_name']
  return (
    <>
      <Typography variant="h6" component="p" className="fw-bold">
        {currentDataContent['name'] && (
          <span className="text-primary">{currentDataContent['name']}</span>
        )}
        {currentDataContent['last_name'] &&
          ` ${currentDataContent['last_name']}`}
      </Typography>
      {Object.keys(currentDataContent).map(key => {
        if (ignoreFields.includes(key)) return null
        return (
          <Typography variant="body1" component="p" className="text-muted">
            {currentDataContent[key]}
          </Typography>
        )
      })}
    </>
  )
}

export default ProfileBasicInfo
