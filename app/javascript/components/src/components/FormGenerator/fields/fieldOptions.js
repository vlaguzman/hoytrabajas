// Fields

import Button from '../../../components/FormGenerator/fields/Button'
import Checkbox from '../../../components/FormGenerator/fields/Checkbox'
import Chips from '../../../components/FormGenerator/fields/Chips'
import ControlledInputs from '../../../components/FormGenerator/fields/ControlledInputs'
import DatePicker from '../../../components/FormGenerator/fields/DatePicker'
import DragNDrop from '../../../components/FormGenerator/fields/DragNDrop'
import FourButtons from '../../../components/FormGenerator/fields/FourButtons'
import MultiSelect from '../../../components/FormGenerator/fields/MultiSelect'
import Radios from '../../../components/FormGenerator/fields/Radios'
import ResponsiveDialog from '../../../components/FormGenerator/fields/ResponsiveDialog'
import Select from '../../../components/FormGenerator/fields/Select'
import SelectChip from '../../../components/FormGenerator/fields/SelectChip'
import SkipButton from '../../../components/FormGenerator/fields/SkipButton'
import Slider from '../../../components/FormGenerator/fields/Slider'
import StandardInput from '../../../components/FormGenerator/fields/StandardInput'
import Switch from '../../../components/FormGenerator/fields/Switch'
import TextChip from '../../../components/FormGenerator/fields/TextChip'

// Wrappers

import SimpleRowWrapper from '../../../components/FormGenerator/wrappers/SimpleRowWrapper'
import FormRowWrapper from '../../../components/FormGenerator/wrappers/FormRowWrapper'

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
