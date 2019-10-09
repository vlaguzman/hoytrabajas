// Fields

import Button from './Button'
import Checkbox from './Checkbox'
import Chips from './Chips'
import DatePicker from './DatePicker'
import DragNDrop from './DragNDrop'
import FourButtons from './FourButtons'
import Radios from './Radios'
import ResponsiveDialog from './ResponsiveDialog'
import Select from './Select'
import SelectChip from './SelectChip'
import SkipButton from './SkipButton'
import Slider from './Slider'
import StandardInput from './StandardInput'
import Switch from './Switch'
import TextChip from './TextChip'

export default {
  button: props => <Button {...props} />,
  standard_input: props => <StandardInput {...props} />,
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
  textchip: props => <TextChip {...props} />,
  slider: props => <Slider {...props} />
}
