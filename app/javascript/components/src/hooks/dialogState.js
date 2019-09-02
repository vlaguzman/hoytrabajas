import { useState } from 'react'

export default initialVal => {
  const [value, setValue] = useState(initialVal)
  const handleClickOpen = () => setValue({ open: true })
  const handleClose = () => setValue({ open: false })
  const toggleState = () => setValue({ open: !value.open })

  return { value, handleClickOpen, handleClose, toggleState }
}
