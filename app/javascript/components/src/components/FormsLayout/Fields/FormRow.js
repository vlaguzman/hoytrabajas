import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'
import Fab from '@material-ui/core/Fab'
import AddIcon from '@material-ui/icons/Add'
import RemoveIcon from '@material-ui/icons/Remove'

const FormRow = props => {
  const {
    rowName,
    addRow,
    removeRow,
    allRows,
    updateAllRows,
    currentRow,
    children
  } = props

  const [rowValue, setRowValue] = useState({
    ...currentRow
  })

  useEffect(() => {
    updateAllRows({ updatedRow: rowValue, rowName, rowID: rowValue.rowID })
  }, [rowValue])

  useEffect(() => {
    if (!currentRow || currentRow.rowID === rowValue.rowID) return
    setRowValue(prevState => ({
      ...prevState,
      rowID: currentRow.rowID
    }))
  }, [currentRow])

  const handleRowChanges = (e, name, autocomplete = null) => {
    setRowValue(prevState => ({
      ...prevState,
      [name]: autocomplete || e.target.value
    }))
  }

  const handleTextChip = e => {
    setRowValue(prevState => ({
      ...prevState,
      id: (e && e.id) || null,
      description: (e && e.description) || null
    }))
  }

  const handleRowDeleteChip = (value, name) => {
    setRowValue(prevState => ({
      ...prevState,
      [name]: ''
    }))
  }

  return (
    <>
      {children({
        rowValue,
        handleTextChip,
        handleRowChanges,
        handleRowDeleteChip
      })}
      <div className="mx-10 my-auto ml-auto">
        {allRows.length > 1 && (
          <Fab
            onClick={() => removeRow({ rowName, rowID: rowValue.rowID })}
            color="primary"
            size="small"
            aria-label="Remove"
            className="fab"
            style={{
              minHeight: '30px',
              height: '30px',
              width: '30px',
              border: '1px solid'
            }}
          >
            <RemoveIcon color="primary" className="w-70" />
          </Fab>
        )}
        <Fab
          onClick={() => addRow({ rowName })}
          color="primary"
          size="small"
          aria-label="Add"
          className="fab"
          style={{
            minHeight: '30px',
            marginLeft: '10px',
            height: '30px',
            width: '30px',
            border: '1px solid'
          }}
        >
          <AddIcon color="primary" className="w-70" />
        </Fab>
      </div>
    </>
  )
}

export default FormRow

FormRow.propTypes = {
  rowName: PropTypes.string,
  addRow: PropTypes.func,
  removeRow: PropTypes.func,
  updateAllRows: PropTypes.func,
  allRows: PropTypes.array,
  currentRow: PropTypes.object,
  children: PropTypes.elementType
}
