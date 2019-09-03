import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import { Col } from 'reactstrap'
import { updateField } from '../../../actions'
import { useTheme } from '@material-ui/styles'
import Typography from '@material-ui/core/Typography'
import Paper from '@material-ui/core/Paper'
import MenuItem from '@material-ui/core/MenuItem'
import Chip from '@material-ui/core/Chip'
import Select from '@material-ui/core/Select'
import Input from '@material-ui/core/Input'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import { connect } from 'react-redux'
import { makeGetField } from '../../../selectors/forms'
import { compareArrays } from 'Helpers'

const MultiSelect = props => {
  const {
    pro: { className, style, formTitle, fields },
    rowName,
    formSection,
    formName,
    dispatch,
    errors = null,
    currentField = null
  } = props
  const [fieldValue, setFieldValue] = useState(currentField || [])
  const theme = useTheme()

  dispatch(
    updateField({
      formSection,
      formName,
      value: {
        [rowName]: fieldValue
      }
    })
  )

  useEffect(() => {
    if (currentField && !compareArrays(currentField, fieldValue))
      setFieldValue(currentField)
  }, [currentField])

  const handleFieldChange = e => {
    const arrayHasItem = fieldValue.includes(e.target.value)
    if (!arrayHasItem && fieldValue.length < 3) {
      const merged = [...fieldValue, e.target.value]
      setFieldValue(merged)
    }
  }

  const handleDeleteChip = (value, isArray = true) => {
    const defaultValue = isArray ? [] : ''
    if (isArray) {
      const newChips = [...fieldValue]
      newChips.splice(newChips.indexOf(value), 1)
      setFieldValue(newChips)
    } else {
      setFieldValue(defaultValue)
    }
  }

  return (
    <>
      <Col className="justify-content-start align-items-start mb-15">
        <Typography
          variant="subtitle2"
          style={{ color: theme.palette.text.secondary }}
        >
          {formTitle}
        </Typography>
      </Col>
      <Paper>
        <Col {...{ className }} style={style}>
          <FormControl error={!!errors} style={{ width: `100%` }}>
            {fields.map(({ pro, aux }, idx) => (
              <Select
                key={pro.name}
                value={fieldValue || []}
                input={
                  <Input
                    className="select-multiple-chip w-100"
                    onChange={handleFieldChange}
                  />
                }
                renderValue={selected => {
                  const auxItem = Array.isArray(selected)
                    ? selected.map(item => aux.find(a => a.value === item))
                    : aux.find(({ value }) => value === selected)
                  return (
                    <div className="d-flex flex-wrap">
                      {Array.isArray(selected) ? (
                        auxItem.map(({ value, label }) => (
                          <Chip
                            key={value}
                            label={label}
                            onDelete={handleDeleteChip}
                            className="mr-5 mt-5"
                          />
                        ))
                      ) : (
                        <Chip
                          key={selected}
                          label={auxItem.label}
                          onDelete={handleDeleteChip}
                          className="mr-5 mt-5"
                        />
                      )}
                    </div>
                  )
                }}
              >
                {aux.map(({ value, label }) => (
                  <MenuItem key={value} value={value}>
                    {label}
                  </MenuItem>
                ))}
              </Select>
            ))}
            {!!errors && <FormHelperText>{errors}</FormHelperText>}
          </FormControl>
        </Col>
      </Paper>
    </>
  )
}

const makeMapStateToProps = () => {
  const getField = makeGetField()
  const mapStateToProps = (state, props) => ({
    currentField: getField(state, props)
  })
  return mapStateToProps
}
export default connect(makeMapStateToProps)(MultiSelect)

MultiSelect.propTypes = {
  pro: PropTypes.object.isRequired,
  rowName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  formName: PropTypes.string.isRequired,
  dispatch: PropTypes.func.isRequired
}
