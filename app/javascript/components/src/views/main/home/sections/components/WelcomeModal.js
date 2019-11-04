import React from 'react'
import PropTypes from 'prop-types'
import Dialog from '@material-ui/core/Dialog'
import Typography from '@material-ui/core/Typography'
import { Row } from 'reactstrap'
import styled from 'styled-components'

const Wrapper = styled.button`
  padding: 0 30px;
  display: flex;
  flex-direction: column;
  text-transform: none !important;
  background: transparent;
  border: none;
`

const WelcomeModal = ({ isOpen, toggleOpenState }) => (
  <Dialog
    fullWidth
    maxWidth="xs"
    open={isOpen}
    onClose={() => toggleOpenState(false)}
  >
    <Wrapper
      id="home-welcome-modal"
      type="button"
      onClick={() => toggleOpenState(false)}
    >
      <Row noGutters className="justify-content-center">
        <img
          src="/assets/static/img/welcome-modal--hola.png"
          className="animated fadeIn w-100"
          alt="welcome"
          style={{ padding: '0 60px' }}
        />
      </Row>
      <Row noGutters className="justify-content-center">
        <img
          src="/assets/static/img/welcome-modal--builders.png"
          className="animated fadeIn w-100 mt-10"
          alt="welcome"
          style={{ padding: '0 90px', textAlign: 'center' }}
        />
      </Row>
      <div>
        <Typography
          className="mt-10"
          variant="h6"
          style={{
            fontSize: '24px',
            textAlign: 'center',
            lineHeight: '30px',
            fontWeight: 900
          }}
        >
          Estamos actualizando
          <br />
          nuestra plataforma
        </Typography>
        <Typography
          className="fw-bold mt-10"
          variant="h6"
          style={{
            fontSize: '18px',
            textAlign: 'center',
            lineHeight: '26px',
            color: '#0b5aa0'
          }}
        >
          Pronto habilitaremos nuevas funcionalidades.
        </Typography>
      </div>
      <Row
        noGutters
        className="justify-content-center"
        style={{ margin: 'auto', padding: '30px 0' }}
      >
        <div className="ht-image">
          <img
            src="/assets/static/img/appLogoC.svg"
            className="mr-15  animated fadeIn"
            alt="site logo"
          />
        </div>
      </Row>
    </Wrapper>
  </Dialog>
)

export default WelcomeModal

WelcomeModal.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  toggleOpenState: PropTypes.func.isRequired
}
