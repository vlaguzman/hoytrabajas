import React from 'react'
import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import CardActions from '@material-ui/core/CardActions'
import Button from '@material-ui/core/Button'
import Divider from '@material-ui/core/Divider'
import ChipsList from './Chips'
import CardHeaderComponent from './CardHeader'
import EditInfoButton from './EditInfoButton'

const DataCard = ({
  editPath = null,
  children,
  middleDivider,
  Chips,
  editInfo,
  titleSec,
  subTitleSec,
  smallTitleSec,
  centerTitleSec,
  actions,
  haveContent,
  ChipsTitle,
  headerKind,
  cardContentStyles
}) => {
  return (
    <Card
      className="py-25 px-25 w-100"
      style={{ display: 'flex', flexDirection: 'column' }}
    >
      {
        {
          titleNoIconChipFav: (
            <CardHeaderComponent
              favorite
              upActions
              {...{ titleSec }}
              chipCheck
            />
          ),
          titleIconNoChipNoFav: (
            <CardHeaderComponent {...{ titleSec }} titleIcon />
          ),
          titleIconNoChipNoFavOnlyClose: (
            <CardHeaderComponent {...{ titleSec }} titleIcon upActions />
          ),
          titleSubNoIconNoChipNoFavCloseEdit: (
            <CardHeaderComponent
              {...{ titleSec }}
              {...{ subTitleSec }}
              {...{ smallTitleSec }}
              upActions
              withEdit
            />
          ),
          onlyTitle: <CardHeaderComponent {...{ titleSec }} />,
          centerTitleOnlyClose: (
            <CardHeaderComponent {...{ centerTitleSec }} upActions />
          ),
          centerTitle: <CardHeaderComponent {...{ centerTitleSec }} />
        }[headerKind]
      }
      {/* ************** */}
      {middleDivider && <Divider variant="middle" className="mx-0 my-10" />}
      {haveContent && (
        <CardContent className="p-0" {...cardContentStyles}>
          {children}
          {Chips && <ChipsList {...{ ChipsTitle }} {...{ Chips }} />}
        </CardContent>
      )}
      {editInfo && (
        <Divider
          className="mx-0"
          variant="middle"
          style={{ marginTop: 'auto' }}
        />
      )}
      {actions && (
        <CardActions className="px-0 pb-0 justify-content-between">
          {editInfo && (
            <EditInfoButton
              text="Editar Información"
              lastUpdate="25 días"
              editPath={editPath}
            />
          )}
        </CardActions>
      )}
    </Card>
  )
}

export default DataCard
