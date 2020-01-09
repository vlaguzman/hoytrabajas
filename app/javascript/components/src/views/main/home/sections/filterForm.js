import React, { useState } from 'react'
import { Form, Col, Row } from 'reactstrap'
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
import dialogState from '../../../../hooks/dialogState'
import RctCollapsibleCard from '../../../../components/Reactify/CollapsibleCard'
import { removeItemFromArr } from '../../../../../utils/array_functions'
import CityFilter from '../../../../../views/home/index/cityFilter'
import AdvancedSearch from '../../../../components/AdvancedSearch'

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
  const [open, setOpen] = React.useState(false)
  const [idJobCategory, setIdJobCategory] = useState([])
  const [valueFilterCategories, setValueFilterCategories] = useState(null)

  function handleJobCategory(idJobCategoryValue, selected) {
    const idsCategories = idJobCategory
    if (!selected) {
      idsCategories.push(idJobCategoryValue)
      setIdJobCategory(idsCategories)
    } else {
      removeItemFromArr(idsCategories, idJobCategoryValue)
      setIdJobCategory(idsCategories)
    }
    setValueFilterCategories(idJobCategory.join())
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
          <Col xs={12} lg={4} key={i}>
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
          {/* TODO oscar ucomment this Button wheh find by categories exist */}

          <FormGen fields={fields1} />
          <CityFilter cities={cities} />
          {/* <ListIcon /> */}
          <button
            className="a-buttonFab a-button--primary mb-10 search_button filterForm__searchButton"
            type="submit"
          >
            <FontAwesomeIcon icon="search" style={{ fontSize: '26px' }} />
          </button>
          {/* TODO oscar Col form of advance search uncomment when advance searh is ready */}
          <div className="pl-10 p-0 align-items-center">
            <IconButton className="text-primary" onClick={handleClickOpen}>
              <FontAwesomeIcon
                className="mx-auto text-primary"
                icon={['fas', 'list']}
                size="xs"
              />
            </IconButton>
            {/* TODO: uncomment to activate the advanced search */}
            {/* <AdvancedSearch
              translations={translations.advancedSearch}
              open={open}
              onClose={handleClose}
            /> */}
          </div>
          <input
            type="hidden"
            name="q[job_category_ids]"
            value={valueFilterCategories}
            multiple
          />
        </Form>
        <CarouselRow items={common} handleJobCategory={handleJobCategory} />
      </RctCollapsibleCard>
    </Row>
  )
}
export default FilterForm

FilterForm.propTypes = {
  common: PropTypes.object.isRequired,
  translations: PropTypes.shape({
    categories: PropTypes.string.isRequired
  }).isRequired,
  button1: PropTypes.object.isRequired,
  fields1: PropTypes.object.isRequired,
  cities: PropTypes.object.isRequired
}
