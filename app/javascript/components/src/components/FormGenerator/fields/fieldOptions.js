// Fields
import React from 'react'
import Button from "./Button"
import Checkbox from "./Checkbox"
import Chips from "./Chips"
import ControlledInputs from "./ControlledInputs"
import DatePicker from "./DatePicker"
import DragNDrop from "./DragNDrop"
import FourButtons from "./FourButtons"
import MultiSelect from "./MultiSelect"
import Radios from "./Radios"
import ResponsiveDialog from "./ResponsiveDialog"
import Select from "./Select"
import SelectChip from "./SelectChip"
import SkipButton from "./SkipButton"
import Slider from "./Slider"
import StandardInput from "./StandardInput"
import Switch from "./Switch"
import TextChip from "./TextChip"

// Wrappers

import SimpleRowWrapper from '../wrappers/SimpleRowWrapper'
import FormRowWrapper from '../wrappers/FormRowWrapper'

export default {
  button: props => <Button {...props} />,
  stInput: props => <StandardInput {...props} />,
  select: props => <Select {...props} />,
  selectChip: props => <SelectChip {...props} />,
  datePicker: props => <DatePicker {...props} />,
  radio: props => <Radios {...props} />,
  checkbox: props => <Checkbox {...props} />,
  switch: props => <Switch {...props} />,
  drag_drop: props => <DragNDrop {...props} />,
  skipButton: props => <SkipButton {...props} />,
  modal: props => <ResponsiveDialog {...props} />,
  chips: props => <Chips {...props} />,
  fourButtons: props => <FourButtons {...props} />,
  controlledInputs: props => <ControlledInputs {...props} />,
  multiSelect: ({ name, ...props }) => (
    <MultiSelect {...props} rowName={name} />
  ),
  formRow: ({ name, ...props }) => <FormRowWrapper {...props} rowName={name} />,
  textchip: props => <TextChip {...props} />,
  slider: props => <Slider {...props} />,
  simpleRow: props => <SimpleRowWrapper {...props} />
}
