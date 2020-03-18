import React from 'react'

export const ShowMessage = (messageList, color = 'black') => {
  return messageList
    ? messageList.map(messages =>
        messages.map(message => (
          <span style={{ color }} key={message}>
            * {message} <br />
          </span>
        ))
      )
    : null
}

export const ShowExperience = experienceList => {
  return experienceList
    ? experienceList.map(experience => (
        <p key={experience}> {`en ${experience[0]} como ${experience[1]}`}</p>
      ))
    : null
}
