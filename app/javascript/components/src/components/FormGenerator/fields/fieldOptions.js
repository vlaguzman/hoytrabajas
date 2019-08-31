// Fields

import Button from 'Components/FormGenerator/fields/Button'
import Checkbox from 'Components/FormGenerator/fields/Checkbox'
import Chips from 'Components/FormGenerator/fields/Chips'
import ControlledInputs from 'Components/FormGenerator/fields/ControlledInputs'
import DatePicker from 'Components/FormGenerator/fields/DatePicker'
import DragNDrop from 'Components/FormGenerator/fields/DragNDrop'
import FourButtons from 'Components/FormGenerator/fields/FourButtons'
import MultiSelect from 'Components/FormGenerator/fields/MultiSelect'
import Radios from 'Components/FormGenerator/fields/Radios'
import ResponsiveDialog from 'Components/FormGenerator/fields/ResponsiveDialog'
import Select from 'Components/FormGenerator/fields/Select'
import SelectChip from 'Components/FormGenerator/fields/SelectChip'
import SkipButton from 'Components/FormGenerator/fields/SkipButton'
import Slider from 'Components/FormGenerator/fields/Slider'
import StandardInput from 'Components/FormGenerator/fields/StandardInput'
import Switch from 'Components/FormGenerator/fields/Switch'
import TextChip from 'Components/FormGenerator/fields/TextChip'

// Wrappers

import SimpleRowWrapper from 'Components/FormGenerator/wrappers/SimpleRowWrapper'
import FormRowWrapper from 'Components/FormGenerator/wrappers/FormRowWrapper'

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
