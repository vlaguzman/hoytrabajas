import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

export const LoginInputWrapper = styled.div`
  border: 1px solid ${props => props.theme.palette.grey['400']};
  border-radius: 0.25rem;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
`

export const LoginInputContainer = styled.div`
  display: flex;
  align-items: center;
  border-bottom-color: ${props => props.theme.palette.grey['400']} !important;
`

const StyledInput = styled.input`
  display: block;
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  color: ${props => props.theme.palette.grey['400']};
  border: 0;
  border-color: ${props => props.theme.palette.grey['400']};
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
`

export const LoginInput = props => (
  <StyledInput 
    style={{ textTransform: 'none', fontSize: '1rem' }} {...props} />
)

LoginInput.propTypes = {
  children: PropTypes.string.isRequired
}
