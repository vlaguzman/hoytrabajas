import React, { useState, useEffect } from 'react'
import { connect } from 'react-redux'
import { Row, Col } from 'reactstrap'
import Fab from '@material-ui/core/Fab'
import AddIcon from '@material-ui/icons/Add'
import RemoveIcon from '@material-ui/icons/Remove'
import MenuItem from '@material-ui/core/MenuItem'
import FormControl from '@material-ui/core/FormControl'
import FormHelperText from '@material-ui/core/FormHelperText'
import Chip from '@material-ui/core/Chip'
import Select from '@material-ui/core/Select'
import Input from '@material-ui/core/Input'
import { makeGetFormRow } from '../../../selectors/forms'
import DownshiftMultiple from './TextChip'

const FormRow = props => {
  const {
    formSection,
    rowName,
    className,
    style,
    fields,
    addRow,
    removeRow,
    allRows,
    updateAllRows,
    errors = null,
    currentRow = null
  } = props

  const [rowValue, setRowValue] = useState({
    ...currentRow
  })

  useEffect(() => {
    updateAllRows({ updatedRow: rowValue, rowID: rowValue.id })
  }, [rowValue])

  useEffect(() => {
    if (!currentRow || currentRow.id === rowValue.id) return
    setRowValue(prevState => ({
      ...prevState,
      id: currentRow.id
    }))
  }, [currentRow])

  const handleChanges = (e, name) => {
    setRowValue(prevState => ({
      ...prevState,
      [name]: e.target.value
    }))
  }

  const handleDeleteChip = name => {
    setRowValue(prevState => ({
      ...prevState,
      [name]: ''
    }))
  }

  return (
    <Row {...{ className, style }}>
      {fields.map(item => {
        const { pro, aux = null, kind, extra = null } = item
        const {
          name,
          className: itemClassname = null,
          style: itemStyle = null,
          sizes = null
        } = pro
        const isTextChip = kind.toLowerCase() === 'textchip'
        return (
          <Col key={name} {...sizes} style={itemStyle}>
            <div className="FormRow FormRow__label beforeLabel">
              {extra && extra.beforeLabel}
            </div>
            {!isTextChip ? (
              <FormControl
                className={itemClassname}
                style={{ flex: 1 }}
                error={!!errors}
              >
                <Select
                  key={name}
                  value={rowValue[name] || ''}
                  input={
                    <Input
                      onChange={e => handleChanges(e, name)}
                      className="select-multiple-chip"
                      style={{
                        flex: 1,
                        margin: `0 10px`
                      }}
                    />
                  }
                  renderValue={selected => {
                    const auxItem = Array.isArray(selected)
                      ? selected.map(sel => aux.find(a => a.value === sel))
                      : aux.find(({ value }) => value === selected)
                    return (
                      <div className="d-flex flex-wrap">
                        {Array.isArray(selected) ? (
                          auxItem.map(({ value, label }) => (
                            <Chip
                              key={value}
                              label={label}
                              onDelete={() => handleDeleteChip(name)}
                              className="mr-5 mt-5"
                            />
                          ))
                        ) : (
                          <Chip
                            key={selected}
                            label={auxItem.label}
                            onDelete={() => {
                              handleDeleteChip(name)
                            }}
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
                {!!errors && <FormHelperText>{errors}</FormHelperText>}
              </FormControl>
            ) : (
              <DownshiftMultiple
                key={name}
                {...{
                  className: itemClassname,
                  formSection,
                  rowName,
                  pro,
                  name,
                  rowValue,
                  setRowValue,
                  extra
                }}
              />
            )}
            <div className="FormRow FormRow__label afterLabel">
              {extra && extra.afterLabel}
            </div>
          </Col>
        )
      })}
      <div className="mx-10 mt-10-xs ml-auto">
        {allRows.length > 1 && (
          <Fab
            onClick={() => removeRow({ rowID: rowValue.id })}
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
          onClick={addRow}
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
    </Row>
  )
}

const makeMapStateToProps = () => {
  const getFormRow = makeGetFormRow()
  const mapStateToProps = (state, props) => ({
    currentRow: getFormRow(state, props)
  })
  return mapStateToProps
}

export default connect(makeMapStateToProps)(FormRow)
