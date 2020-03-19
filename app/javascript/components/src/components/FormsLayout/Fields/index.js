import Button from './Button'
import Checkbox from './Checkbox'
import DatePicker from './DatePicker'
import DragNDrop from './DragNDrop'
import FourButtons from './FourButtons'
import Radios from './Radios'
import Select from './Select'
import SelectChip from './SelectChip'
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
  fourButtons: props => <FourButtons {...props} />,
  textchip: props => <TextChip {...props} />,
  slider: props => <Slider {...props} />
}
