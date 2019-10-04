import React, { Fragment } from 'react'
import { makeStyles } from '@material-ui/core/styles'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import Divider from '@material-ui/core/Divider'
import ListItemText from '@material-ui/core/ListItemText'
import Typography from '@material-ui/core/Typography'
import ListItemIcon from '@material-ui/core/ListItemIcon'
import InboxIcon from '@material-ui/icons/Inbox'

const MaterialList = ({ internalList, arreglo = [] }) => {
  const type = {
    withIcon: items =>
      items.map(({ label, icon }, i, arr) => (
        <ListItem divider={i != arr.length - 1} key={label}>
          <ListItemIcon>
            <img
              // reemplazar por carpeta /assets/static
              src={`/assets/static/custom-icons/${icon}.svg`}
              className="mr-10 d-inline"
              alt="Ícono"
            />
          </ListItemIcon>
          <ListItemText primary={label} />
        </ListItem>
      )),
    withOutIcon: items =>
      items.map(({ label1, label2 }, i, arr) => (
        <ListItem divider={i != arr.length - 1} key={label1} className="px-0">
          <ListItemText
            className="d-flex flex-row-reverse justify-content-between pr-0"
            primary={label2}
            primaryTypographyProps={{ className: 'text-right' }}
            secondary={label1}
          />
        </ListItem>
      ))
  }
  return (
    <>
      <List>{type[internalList](arreglo)}</List>
    </>
  )
}
export default MaterialList
