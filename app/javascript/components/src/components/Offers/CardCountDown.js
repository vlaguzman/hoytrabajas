import React, { useEffect, useState } from 'react'
import PropTypes from 'prop-types'
import { Typography } from '@material-ui/core'

const addTheZero = number =>
  number.toString().length < 2 ? `0${number}` : number;

const hourBuilder = (hour, minutes) =>
  `${addTheZero(hour)}:${addTheZero(minutes)}`

const restDaysbuilder = days => `${days}D`

const days = distance => Math.floor(distance / (1000 * 60 * 60 * 24))
const hours = distance =>
  Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
const minutes = distance =>
  Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
const seconds = distance => Math.floor((distance % (1000 * 60)) / 1000)

const restTimeCalculator = limitDate =>
  limitDate.getTime() - new Date().getTime()

const restTimeBuilder = distance => {
  const distanceDays = days(distance)
  const distanceHours = hours(distance)
  const distanceMinutes = minutes(distance)
  const distanceSecons = seconds(distance)

  const daysLine = distanceDays > 0 && restDaysbuilder(distanceDays)
  const hoursLine =
    distanceDays === 0 &&
    distanceHours !== 0 &&
    distanceHours > 0 &&
    hourBuilder(distanceHours, distanceMinutes, distanceSecons)

  return (
    <>
      <span> {daysLine} </span>
      <span> {hoursLine} </span>
    </>
  )
}

const burnMidnight = (date) => {
  return new Date(date.getYear(), date.getMonth(), date.getDate(), 23, 59)
}

const CardCountDown = ({ closeDate }) => {


  const [timeLeft, setTimeleft] = useState(restTimeCalculator(burnMidnight(closeDate)))

  useEffect(() => {
    setTimeout(() => {
      setTimeleft(restTimeCalculator(closeDate))
    }, 1000)
  }, [timeLeft])

  return timeLeft > 0 && (
    <Typography
      variant="body1"
      className="CardCountDown fw-bold offerTimer color__slategray-dark"
      component="span"
    >
      <i className="offerLocationIcon material-icons">timer</i>
      {restTimeBuilder(timeLeft)}
    </Typography>
  )
}

export default CardCountDown

CardCountDown.propTypes = {
  closeDate: PropTypes.any
}
