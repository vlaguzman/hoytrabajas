import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'
import theme from '../Layout/Theme'

export const LoginInputWrapper = styled.div`
  border: 1px solid ${theme.palette.grey['400']};
  border-radius: 0.25rem;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
`

export const LoginInput = props => (
  <StyledInput style={{ textTransform: 'none', fontSize: '1rem' }} {...props} />
)

LoginInput.propTypes = {
  children: PropTypes.string.isRequired
}
