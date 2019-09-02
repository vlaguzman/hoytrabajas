import React, { useState, useEffect } from 'react'
import validator from 'validator'

const verifyLength = ({ value, extra }) =>
  !validator.isLength(value, {
    min: extra.minLength,
    max: extra.maxLength
  })

const verifyNumeric = ({ value }) => !/^[0-9 ]+$/.test(value)
const verifyInt = ({ value }) => !validator.isInt(value)
const verifyLetters = ({ value }) => !/^[A-Za-z ]+$/.test(value)
// const verifyInt = ({ value }) => !validator.isInt(value)

const getErrorField = ({ value: val, extra }) => {
  const value = `${val}`
  if (!extra || !value) return false

  if (
    (extra.isNumeric && verifyNumeric({ value })) ||
    (extra.isInt && verifyInt({ value }))
  )
    return 'Por favor, utiliza solo números.'

  if (extra.isLength && verifyLength({ value, extra }))
    return `Has excedido el límite de ${extra.maxLength} caracteres.`

  if (extra.isLetters && verifyLetters({ value, extra }))
    return 'Por favor, utiliza solo caracteres de texto.'

  return false
}

// eslint-disable-next-line
export const useValidation = currentValidation => {
  const [validation, setValidation] = useState(currentValidation || false)

  const validateField = props => {
    const { value, extra, name } = props
    const errorMessage = getErrorField({ value, extra, name })
    setValidation(prevState => ({
      ...prevState,
      [name]: {
        ...prevState.isRequired,
        errorMessage
      }
    }))
  }

  return { validation, validateField, setValidation }
}
