import React from 'react'
import HighlightOff from '@material-ui/icons/HighlightOff'
import styled from 'styled-components'

const Wrapper = styled.div`
  width: 100%;
  height: 100%;
  position: relative;
  svg {
    font-size: 2rem;
    margin: auto 20px auto auto;
  }
`

const CloseIcon = props => (
  <Wrapper
    style={{
      right: 0,
      top: 0,
      height: '100%',
      paddingRight: '20px',
      position: 'absolute',
      display: 'flex',
      alignItems: 'center'
    }}
  >
    <HighlightOff
      {...props}
      style={{ cursor: 'pointer' }}
      className="modal--close-icon"
    />
  </Wrapper>
)

export default CloseIcon
