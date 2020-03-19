import React, { useState } from 'react'
import { Form, Col, Collapse, Row } from 'reactstrap'
import IconButton from '@material-ui/core/IconButton'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import PropTypes from 'prop-types'
import FormControl from '@material-ui/core/FormControl'
import Select from '@material-ui/core/Select'
import MenuItem from '@material-ui/core/MenuItem'
import Input from '@material-ui/core/Input'
import InputLabel from '@material-ui/core/InputLabel'
import FormGen from './components/formFieldGenerartor'
import CarouselRow from './components/carousel/carousel'
import dialogState from '../../../src/hooks/dialogState'
import RctCollapsibleCard from '../../../src/components/Reactify/CollapsibleCard'
import CityFilter from '../cityFilter'
import AdvancedSearch from '../../../src/components/AdvancedSearch'

const names = [
  'Oliver Hansen',
  'Van Henry',
  'April Tucker',
  'Ralph Hubbard',
  'Omar Alexander',
  'Carlos Abbott',
  'Miriam Wagner',
  'Bradley Wilkerson',
  'Virginia Andrews',
  'Kelly Snyder'
]

const FilterForm = ({ translations, common, button1, fields1, cities }) => {
  // TODO oscar remove this line when in rails when can searh by other fields
  fields1 = [fields1[0]]

  const { value: state, toggleState } = dialogState({ open: false })
  const [open, setOpen] = useState(false)
  const [openCategories, setOpenCategories] = useState(false)
  const [jobCategoryIds, setJobCategoryIds] = useState([])

  function handleJobCategory(newId, selected) {
    if (!selected) {
      setJobCategoryIds([...jobCategoryIds, newId])
      setOpenCategories(false)
    } else {
      const newArray = jobCategoryIds.filter(id => id !== newId)
      setJobCategoryIds(newArray)
    }
  }

  const handleClickCategories = () => {
    setOpenCategories(!openCategories)
  }

  function handleClickOpen() {
    setOpen(true)
  }

  function handleClose() {
    setOpen(false)
  }

  const [personName, setPersonName] = React.useState([])

  function handleChange(event) {
    setPersonName(event.target.value)
  }

  function handleChangeMultiple(event) {
    const { options } = event.target
    const value = []
    for (let i = 0, l = options.length; i < l; i += 1) {
      if (options[i].selected) {
        value.push(options[i].value)
      }
    }
    setPersonName(value)
  }

  const arregloCampos = arreglo => {
    return (
      <>
        {arreglo.map(({ label, placeholder }, i) => (
          <Col xs={12} lg={4} key={label}>
            <FormControl>
              <InputLabel htmlFor="select-multiple-checkbox">
                {label}
              </InputLabel>
              <Select
                multiple
                value={personName}
                onChange={handleChange}
                className="w-70 mb-20"
                input={<Input id="select-multiple-checkbox" />}
                renderValue={selected => selected.join(', ')}
              >
                <MenuItem disabled value="">
                  <em>{placeholder}</em>
                </MenuItem>
                {names.map(name => (
                  <MenuItem key={name} value={name}>
                    {name}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </Col>
        ))}
      </>
    )
  }

  return (
    <Row className="m-filterForm justify-content-center" noGutters>
      <RctCollapsibleCard
        /* TODO oscar i change 'col-9' to 'col-4' on 'colClasses' to reduce size bar */
        colClasses="col-9 d-none d-lg-block "
        contentCustomClasses=""
        customClasses="m-0"
      >
        <Form
          className="row justify-content-around align-items-center"
          action="offers/"
          method="get"
        >
          <button
            type="button"
            className="a-button --primary filterForm__categoriesButton"
            onClick={handleClickCategories}
          >
            {translations.filterForm.categories}
          </button>
          <FormGen fields={fields1} />
          <CityFilter cities={cities} />
          {/* <ListIcon /> */}
          <button
            className="a-buttonFab --primary mb-10 search_button filterForm__searchButton"
            type="submit"
          >
            <FontAwesomeIcon icon="search" style={{ fontSize: '26px' }} />
          </button>
          {/* TODO: uncomment to activate the advanced search */}
          {/* <div className="pl-10 p-0 align-items-center">
            <IconButton className="text-primary" onClick={handleClickOpen}>
              <FontAwesomeIcon
                className="mx-auto text-primary"
                icon={['fas', 'list']}
                size="xs"
              />
            </IconButton>
            <AdvancedSearch
              translations={translations.advancedSearch}
              open={open}
              onClose={handleClose}
            />
          </div> */}
          <input
            type="hidden"
            name="q[job_category_ids]"
            value={jobCategoryIds.join()}
            multiple
          />
        </Form>
        <Collapse
          isOpen={openCategories}
          className="filterForm__collapseCategories"
        >
          <CarouselRow
            items={common}
            jobCategoryIds={jobCategoryIds}
            handleJobCategory={handleJobCategory}
          />
        </Collapse>
      </RctCollapsibleCard>
    </Row>
  )
}
export default FilterForm

FilterForm.propTypes = {
  common: PropTypes.object.isRequired,
  translations: PropTypes.shape({
    filterForm: PropTypes.shape({
      categories: PropTypes.string.isRequired
    }),
    advancedSearch: PropTypes.object.isRequired
  }).isRequired,
  button1: PropTypes.object.isRequired,
  fields1: PropTypes.object.isRequired,
  cities: PropTypes.object.isRequired
}
