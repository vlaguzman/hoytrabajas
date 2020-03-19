import React from 'react'
import Typography from '@material-ui/core/Typography'
import Button from '@material-ui/core/Button'
import styled from 'styled-components'

export const ResponsiveTitle = styled(Typography)`
  font-size: 24px;
  line-height: 30px;
`

export const ResponsiveText = styled(Typography)`
  font-size: 16px;
  line-height: 26px;
`

export const ResponsiveButton = styled(Button)`
  border-radius: 50px;
  padding: 15px 0;
  width: 100%;
  margin: auto;
`

export const ResponsiveWrapper = styled.div`
  display: flex;
  flex-direction: column;
`
