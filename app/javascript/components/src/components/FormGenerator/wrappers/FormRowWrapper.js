import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import uuidv4 from 'uuid/v4'
import { connect } from 'react-redux'
import { Col } from 'reactstrap'
import { updateField } from '../actions'
import { makeGetAllRows } from 'Src/selectors/forms'
import { useTheme } from '@material-ui/styles'
import Typography from '@material-ui/core/Typography'
import FormRow from '../components/FormGenerator/fields/FormRow'
import Paper from '@material-ui/core/Paper'

const FormRowWrapper = props => {
  const {
    pro: { className, style, formTitle, fields },
    rowName,
    formSection,
    formName,
    dispatch,
    allFormRows = null
  } = props
  const theme = useTheme()
  const defaultId = uuidv4()
  const defaultRows = [
    {
      id: defaultId
    }
  ]
  const [allRows, setAllRows] = useState(allFormRows || defaultRows)
  const [errors, setErrors] = useState(false)

  const addRow = () => {
    setAllRows(prevState => [
      ...prevState,
      {
        id: uuidv4()
      }
    ])
  }

  const updateAllRows = ({ updatedRow, rowID }) => {
    const rowIndex = allRows.findIndex(row => row.id === rowID)
    // eslint-disable-next-line
    let newRows = [...allRows]
    if (rowIndex !== -1) {
      newRows[rowIndex] = updatedRow
      setAllRows(newRows)
    }

    dispatch(
      updateField({
        formSection,
        formName,
        value: {
          [rowName]: newRows
        }
      })
    )
  }

  const removeRow = ({ rowID }) => {
    if (allRows.length > 1) {
      const filteredRows = allRows.filter(row => row.id !== rowID)
      setAllRows(filteredRows)
      dispatch(
        updateField({
          formSection,
          formName,
          value: {
            [rowName]: filteredRows
          }
        })
      )
    }
  }

  useEffect(() => {
    dispatch(
      updateField({
        formSection,
        formName,
        value: {
          [rowName]: allRows
        }
      })
    )
  }, [])

  return (
    <>
      {formTitle && (
        <Col className="justify-content-start align-items-start mb-15">
          <Typography
            variant="subtitle2"
            style={{ color: theme.palette.text.secondary }}
          >
            {formTitle}
          </Typography>
        </Col>
      )}
      <Paper style={{ width: '100%' }}>
        {allRows.map(item => (
          <FormRow
            key={item.id}
            {...{
              formRow: item,
              fields,
              formName,
              formSection,
              rowName,
              className,
              style,
              errors,
              addRow,
              removeRow,
              updateAllRows,
              allRows
            }}
          />
        ))}
      </Paper>
    </>
  )
}

const makeMapStateToProps = () => {
  const getAllRows = makeGetAllRows()
  const mapStateToProps = (state, props) => ({
    allFormRows: getAllRows(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(FormRowWrapper)

FormRowWrapper.propTypes = {
  pro: PropTypes.object.isRequired,
  rowName: PropTypes.string.isRequired,
  formSection: PropTypes.string.isRequired,
  formName: PropTypes.string.isRequired,
  dispatch: PropTypes.func.isRequired
}
