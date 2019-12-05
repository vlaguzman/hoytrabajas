import React, { useState } from 'react'
import { Form, Col, Collapse, Row } from 'reactstrap'
import Button from '@material-ui/core/Button'
import IconButton from '@material-ui/core/IconButton'
import Fab from '@material-ui/core/Fab'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import PropTypes from 'prop-types'

import Dialog from '@material-ui/core/Dialog'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import Typography from '@material-ui/core/Typography'
import CloseIcon from '@material-ui/icons/Close'
import Slide from '@material-ui/core/Slide'

import Radio from '@material-ui/core/Radio'
import RadioGroup from '@material-ui/core/RadioGroup'
import FormControlLabel from '@material-ui/core/FormControlLabel'
import FormControl from '@material-ui/core/FormControl'
import FormLabel from '@material-ui/core/FormLabel'
import RadioButtonUncheckedIcon from '@material-ui/icons/RadioButtonUnchecked'
import RadioButtonCheckedIcon from '@material-ui/icons/RadioButtonChecked'
import Select from '@material-ui/core/Select'
import MenuItem from '@material-ui/core/MenuItem'
import Input from '@material-ui/core/Input'
import InputLabel from '@material-ui/core/InputLabel'
import FormGen from './components/formFieldGenerartor'
import CarouselRow from './components/carousel/carousel'
import dialogState from '../../../../hooks/dialogState'
import RctCollapsibleCard from '../../../../components/Reactify/CollapsibleCard'
import { removeItemFromArr } from '../../../../../utils/array_functions'

const Transition = React.forwardRef(function Transition(props, ref) {
  return <Slide direction="up" ref={ref} {...props} />
})

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

const currencies = [
  {
    value: 'USD',
    label: '$'
  },
  {
    value: 'EUR',
    label: '€'
  },
  {
    value: 'BTC',
    label: '฿'
  },
  {
    value: 'JPY',
    label: '¥'
  }
]

const FilterForm = ({ common, button1, fields1 }) => {
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
    <Row className="justify-content-center" noGutters>
      <RctCollapsibleCard
        /* TODO oscar i change 'col-9' to 'col-4' on 'colClasses' to reduce size bar */
        colClasses="col-9 my-30 d-none d-lg-block "
        contentCustomClasses=""
      >
        <Form
          className="row justify-content-around"
          action="offers/"
          method="get"
        >
          <Col xs={12} md={1} className="pt-rem pl-0 p-0 align-items-center">
            {/* TODO oscar ucomment this Button wheh find by categories exist */}
            {
              <Button
                type="button"
                onClick={toggleState}
                className="text-primary h-50"
              >
                {button1}
              </Button>
            }
          </Col>
          <FormGen fields={fields1} />
          <Fab
            className="mb-10 search_button text-white"
            color="primary"
            type="submit"
          >
            <FontAwesomeIcon icon="search" size="sm" />
          </Fab>
          {/* TODO oscar Col form of advance search uncomment when advance searh is ready */}
          <Col xs={12} md={1} className="pl-0 p-0 align-items-center">
            {/* <IconButton
              className="text-primary"
              style={{ width: '55%', height: '60%' }}
              onClick={handleClickOpen}
            >
              <FontAwesomeIcon
                className="mx-auto text-primary"
                icon={['fas', 'list']}
                size="xs"
              />
            </IconButton> */}

            {/* TODO oscar this dialog is the advance form to searh */}

            <Dialog
              style={{ backgroundColor: '#F5F5F5' }}
              fullScreen
              open={open}
              onClose={handleClose}
              TransitionComponent={Transition}
            >
              <AppBar className="position-relative text-white">
                <Toolbar>
                  <FontAwesomeIcon
                    className="mx-auto text-primary"
                    icon={['fas', 'list']}
                  />
                  <Typography variant="h6" style={{ flex: '1' }}>
                    Busqueda Avanzada
                  </Typography>
                  <Button
                    variant="outlined"
                    style={{
                      borderRadius: '30px',
                      color: 'white',
                      borderColor: 'white'
                    }}
                    className="mx-5"
                  >
                    Borrar
                  </Button>
                  <Button
                    variant="outlined"
                    style={{
                      borderRadius: '30px',
                      borderColor: 'white',
                      color: 'white'
                    }}
                    className="mx-20"
                  >
                    Buscar
                  </Button>
                  <IconButton
                    edge="start"
                    color="inherit"
                    onClick={handleClose}
                    aria-label="close"
                  >
                    <CloseIcon />
                  </IconButton>
                </Toolbar>
              </AppBar>

              <Col xs={12} className="px-auto py-50 mb-70 align-items-center">
                {/* ************************** */}
                {/* Primera Linea  */}
                {/* *********************** */}
                <Row className="mx-0 px-40">
                  <Col>
                    <FormControl component="fieldset">
                      <FormLabel component="legend">
                        Fecha de publicación
                      </FormLabel>
                      <RadioGroup aria-label="gender" name="gender1">
                        {[
                          'Últimas 24 horas',
                          'Semana pasada',
                          'Mes pasado',
                          'Cualquier Momento'
                        ].map((e, i) => (
                          <FormControlLabel
                            key={i}
                            className="m-0"
                            value={e}
                            control={
                              <Radio
                                icon={
                                  <RadioButtonUncheckedIcon fontSize="small" />
                                }
                                checkedIcon={
                                  <RadioButtonCheckedIcon fontSize="small" />
                                }
                              />
                            }
                            label={<Typography variant="body2">{e}</Typography>}
                          />
                        ))}
                      </RadioGroup>
                    </FormControl>
                  </Col>
                  <Col>
                    <FormControl component="fieldset">
                      <FormLabel component="legend">
                        Fecha de publicación
                      </FormLabel>
                      <RadioGroup aria-label="gender" name="gender1">
                        {['1 año', '2 años', 'sin experiencia'].map((e, i) => (
                          <FormControlLabel
                            key={i}
                            className="m-0"
                            value={e}
                            control={
                              <Radio
                                icon={
                                  <RadioButtonUncheckedIcon fontSize="small" />
                                }
                                checkedIcon={
                                  <RadioButtonCheckedIcon fontSize="small" />
                                }
                              />
                            }
                            label={<Typography variant="body2">{e}</Typography>}
                          />
                        ))}
                      </RadioGroup>
                    </FormControl>
                  </Col>
                  <Col>
                    <FormControl component="fieldset">
                      <FormLabel component="legend">
                        Fecha de publicación
                      </FormLabel>
                      <RadioGroup aria-label="gender" name="gender1">
                        {['1 año', '2 años', 'sin experiencia'].map((e, i) => (
                          <FormControlLabel
                            key={i}
                            className="m-0"
                            value="female"
                            control={
                              <Radio
                                icon={
                                  <RadioButtonUncheckedIcon fontSize="small" />
                                }
                                checkedIcon={
                                  <RadioButtonCheckedIcon fontSize="small" />
                                }
                              />
                            }
                            label={<Typography variant="body2">{e}</Typography>}
                          />
                        ))}
                      </RadioGroup>
                    </FormControl>
                  </Col>
                </Row>
                {/* ************************** */}
                {/* segunda Linea  */}
                {/* *********************** */}
                <Row className="mx-0 px-40">
                  {arregloCampos([
                    {
                      label: 'Cargo',
                      placeholder: 'Escribe el cargo a buscar'
                    },
                    {
                      label: 'Categorias de trabajo',
                      placeholder: 'Categorias de trabajo'
                    },
                    {
                      label: 'Ciudad',
                      placeholder: 'Selecciona la ciudad de interes'
                    }
                  ])}
                </Row>
                {/* ************************** */}
                {/* tercera Linea  */}
                {/* *********************** */}
                <Row className="mx-0 px-40">
                  {arregloCampos([
                    {
                      label: 'Localidad',
                      placeholder: 'Selecciona la localidad de interes'
                    },

                    {
                      label: 'Tipo de oferta',
                      placeholder: 'Selecciona el tipo de oferta de interes'
                    },

                    {
                      label: 'Tipo de contratación',
                      placeholder: 'Selecciona la ciudad de interes'
                    }
                  ])}
                </Row>
                {/* ************************** */}
                {/* cuarta Linea  */}
                {/* *********************** */}
                <Row className="mx-0 px-40">
                  {arregloCampos([
                    {
                      label: 'Modalidad de trabajo',
                      placeholder: 'Selecciona la localidad de interes'
                    },

                    {
                      label: 'Auxilios o prestaciones',
                      placeholder: 'Selecciona el tipo de oferta de interes'
                    },

                    {
                      label: 'Días disponibles para trabajar',
                      placeholder: 'Selecciona el tipo de oferta de interes'
                    }
                  ])}
                </Row>
                {/* ************************** */}
                {/* quinta Linea  */}
                {/* *********************** */}
                <Row className="mx-0 px-40">
                  {arregloCampos([
                    {
                      label: 'Jornada',
                      placeholder: 'Selecciona la ciudad de interes'
                    },
                    {
                      label: 'Aspiración salarial',
                      placeholder: 'Selecciona el salario'
                    },
                    {
                      label: 'Tiempo',
                      placeholder: 'Periodo de tu aspiracion salarial'
                    }
                  ])}
                </Row>
                {/* ************************** */}
                {/* sexta Linea  */}
                {/* *********************** */}
                <Row className="px-40 mx-0 mb-30 w-100 justify-content-start">
                  {arregloCampos([
                    {
                      label: 'Nivel de educación',
                      placeholder: 'Selecciona alguna de las opciones'
                    },
                    {
                      label: 'Idiomas',
                      placeholder: 'Selecciona alguna de las opciones'
                    }
                  ])}
                </Row>
              </Col>
            </Dialog>
          </Col>
          <input
            type="hidden"
            name="q[job_category_ids]"
            value={valueFilterCategories}
            multiple
          />
        </Form>
        <Collapse isOpen={state.open}>
          <CarouselRow items={common} handleJobCategory={handleJobCategory} />
        </Collapse>
      </RctCollapsibleCard>
    </Row>
  )
}
export default FilterForm

FilterForm.propTypes = {
  common: PropTypes.object.isRequired,
  button1: PropTypes.object.isRequired,
  fields1: PropTypes.object.isRequired
}
