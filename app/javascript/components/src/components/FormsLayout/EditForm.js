import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import Typography from '@material-ui/core/Typography'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import CardHeader from '@material-ui/core/CardHeader'
import IconButton from '@material-ui/core/IconButton'
import FavoriteBorder from '@material-ui/icons/FavoriteBorder'
import Chip from '@material-ui/core/Chip'
import { FormProvider } from '../context/formContext'
import FormBody from '../views/edicion_oferta/sections/forms/sections/FormBody'

const FavoriteButton = () => (
  <IconButton className="p-0" aria-label="Settings">
    <FavoriteBorder />
  </IconButton>
)

const OpenOffer = ({ chipContent }) => (
  <Chip
    className="text-white mt-20 mr-20 d-none d-md-inline-block"
    label={
      <Typography variant="caption" className="m-5">
        {chipContent}
      </Typography>
    }
    clickable
    color="primary"
  />
)

const EditForm = props => {
  const { chipContent, title, formName, form } = props

  const myRef = React.createRef()

  const scrollTop = () => {
    setTimeout(() => {
      myRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }
  

  return (
    <Row className="mb-25 mx-0 px-20">
      <Col xs={12} className='px-0'>
        <Card className="p-25">
          <CardHeader
            action={chipContent && <OpenOffer {...{ chipContent }} />}
            title={<FavoriteButton />}
            subheader={
              <Typography className="mb-10 fw-bold" variant="h6">
                {title}
              </Typography>
            }
          />
          <CardContent className='px-0'>
            <FormProvider formName={formName} singleForm={form}>
              <FormBody scrollAction={scrollTop} />
            </FormProvider>
          </CardContent>
        </Card>
      </Col>
    </Row>
  )
}

export default EditForm

EditForm.propTypes = {
  chipContent: PropTypes.string,
  title: PropTypes.string.isRequired
}
