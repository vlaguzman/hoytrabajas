export const handleBoolean = setFormValues => {
  return (e, inputName) => {
    if (e.persist) e.persist()
    setFormValues(prevFormValues => ({
      ...prevFormValues,
      [inputName]: e.target.checked
    }))
  }
}

export const handleChange = (formValues, setFormValues) => {
  return (e, inputName, isMultiple = false) => {
    e.persist()
    if (isMultiple) {
      const isArray = Array.isArray(formValues[inputName])
      if (isArray) {
        const arrayHasItem = formValues[inputName].includes(e.target.value)
        if (!arrayHasItem) {
          const merged = [...formValues[inputName], e.target.value]
          setFormValues(prevFormValues => ({
            ...prevFormValues,
            [inputName]: merged
          }))
        }
      } else {
        setFormValues(prevFormValues => ({
          ...prevFormValues,
          [inputName]: [e.target.value]
        }))
      }
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: e.target.value
      }))
    }
  }
}

export const handleDeleteChip = (formValues, setFormValues) => {
  return (id, inputName, isMultiple) => {
    if (isMultiple) {
      const newChips = [...formValues[inputName]]
      newChips.splice(newChips.indexOf(id), 1)
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: newChips
      }))
    } else {
      setFormValues(prevFormValues => ({
        ...prevFormValues,
        [inputName]: ''
      }))
    }
  }
}

export const handleSimpleChange = (formValues, setFormValues) => {
  return (newValue, inputName) => {
    setFormValues(prevFormValues => ({
      ...prevFormValues,
      [inputName]: newValue
    }))
  }
}
