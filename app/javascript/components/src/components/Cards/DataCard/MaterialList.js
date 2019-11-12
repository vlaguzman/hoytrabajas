import React from 'react'
import PropTypes from 'prop-types'
import List from '@material-ui/core/List'
import ListItem from '@material-ui/core/ListItem'
import ListItemText from '@material-ui/core/ListItemText'
import ListItemIcon from '@material-ui/core/ListItemIcon'

const MaterialList = props => {
  const { internalList, listItems = [] } = props
  return (
    <>
      <List>
        {internalList === 'withIcon' &&
          listItems.map(({ label, icon }, i, arr) => (
            <ListItem divider={i !== arr.length - 1} key={label}>
              <ListItemIcon>
                <img
                  src={`/assets/static/custom-icons/${icon}.svg`}
                  className="mr-10 d-inline"
                  alt="Ícono"
                />
              </ListItemIcon>
              <ListItemText primary={label} />
            </ListItem>
          ))}

        {internalList === 'withoutIcon' &&
          listItems.map(({ label, value }, i, arr) => (
            <ListItem
              divider={i !== arr.length - 1}
              key={label}
              className="px-0"
            >
              <ListItemText
                className="d-flex flex-row-reverse justify-content-between pr-0"
                primary={value}
                primaryTypographyProps={{ className: 'text-right' }}
                secondary={label}
              />
            </ListItem>
          ))}
      </List>
    </>
  )
}
export default MaterialList

MaterialList.propTypes = {
  internalList: PropTypes.string.isRequired,
  listItems: PropTypes.array.isRequired
}
