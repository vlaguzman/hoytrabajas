import React from 'react'
import PropTypes from 'prop-types'
import MaterialList from '../MaterialList'
import ProfileAddContent from './ProfileAddContent'

const ProfileList = ({ list }) =>
  list.length > 0 ? (
    <MaterialList internalList="withoutIcon" listItems={list} />
  ) : (
    <ProfileAddContent action="Agregar información" />
  )

export default ProfileList
