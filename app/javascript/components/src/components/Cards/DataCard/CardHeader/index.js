import React, { Fragment } from 'react'
import CardHeader from '@material-ui/core/CardHeader'
import Chip from '@material-ui/core/Chip'
import IconButton from '@material-ui/core/IconButton'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
import Typography from '@material-ui/core/Typography'
import CheckCircle from '@material-ui/icons/CheckCircle'
import HighlightOff from '@material-ui/icons/HighlightOff'
import Avatar from '@material-ui/core/Avatar'
import { Row } from 'reactstrap'

const CardHeaderComponent = ({
  titleSec,
  subTitleSec,
  smallTitleSec,
  centerTitleSec,
  chipCheck,
  centerIcon,
  upActions,
  favorite,
  withEdit,
  titleIcon
}) => {
  const title = favorite ? (
    <IconButton className="p-0" aria-label="Settings">
      <FavoriteBorder />
    </IconButton>
  ) : (
    ''
  )
  const subheader = (
    <Fragment>
      {centerTitleSec ? (
        <Typography variant="subtitle1" className="text-center fw-bold">
          {centerTitleSec}
        </Typography>
      ) : (
        <Row className="flex-nowrap" noGutters>
          {titleIcon && (
            <Avatar aria-label="Recipe" className="bg-white mr-5">
              <img
                // reemplazar por carpeta /assets/static
                src="/assets/static/custom-icons/icon-disponibilidad.svg"
                className=""
                alt="Contiene un ícono de disponibilidad"
              />
            </Avatar>
          )}
          <Typography
            variant="subtitle1"
            className="text-left fw-bold title-margin-top"
          >
            {titleSec}
          </Typography>
        </Row>
      )}
      {subTitleSec && (
        <Typography variant="body2" className="text-primary fw-bold">
          {subTitleSec}
        </Typography>
      )}
      {smallTitleSec && (
        <Typography variant="caption" className="fw-bold">
          {smallTitleSec}
        </Typography>
      )}
    </Fragment>
  )
  return (
    <CardHeader
      action={
        <Fragment>
          {upActions &&
            (chipCheck ? (
              <Chip
                className="text-white mt-20 mr-20"
                label="Completado"
                clickable
                color="primary"
                style={{padding: '2%'}}
                onDelete={() => alert('delete icon')}
                deleteIcon={<CheckCircle className="text-white" />}
              />
            ) : (
              <Fragment>
                {withEdit && (
                  <div
                    style={{
                      color: 'blue',
                      fontSize: '1rem',
                      position: 'absolute',
                      top: '1.65rem',
                      right: '3rem'
                    }}
                  >
                    <span className="d-inline-block text-primary">
                      <i className="ti-pencil-alt" />
                    </span>
                  </div>
                )}
                <div
                  style={{
                    color: 'blue',
                    fontSize: '1rem',
                    position: 'absolute',
                    top: '1.5rem',
                    right: '1.5rem'
                  }}
                >
                  <span className="d-inline-block">
                    <HighlightOff style={{ fontSize: '1rem' }} />
                  </span>
                </div>
              </Fragment>
            ))}
        </Fragment>
      }
      className="pb-5 px-0 pt-0"
      disableTypography
      {...{ title }}
      {...{ subheader }}
    />
  )
}

export default CardHeaderComponent
