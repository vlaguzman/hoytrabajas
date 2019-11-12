import React from 'react'
import PropTypes from 'prop-types'
import { Row, Col } from 'reactstrap'
import DataCard from '../../../../components/Cards/DataCard'
import MaterialList from '../../../../components/Cards/DataCard/MaterialList'
import ProfileBasicInfo from '../../../../components/Cards/DataCard/Content/ProfileBasicInfo'
import ProfileDefault from '../../../../components/Cards/DataCard/Content/ProfileDefault'
import { listOfIcons } from '../data'

const FirstSection = props => {
  const { basic_info, about_user, user_interests } = props

  return (
    <>
      <Row className="justify-content-between w-100 px-5 mx-0 my-20">
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            haveContent
            titleSec="Datos"
            editPath={basic_info.edit_path}
          >
            <ProfileBasicInfo fields={{ ...basic_info.fields }} />
          </DataCard>
        </Col>
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <Col className="px-10 mb-5">
            <DataCard
              headerKind="titleIconNoChipNoFav"
              titleSec="¿Cuál es tu disponibilidad laboral hoy?"
            />
          </Col>
          <Col className="px-10 mt-5">
            <DataCard
              headerKind="onlyTitle"
              haveContent
              titleSec="Mi curriculum"
            >
              <MaterialList internalList="withIcon" listItems={listOfIcons} />
            </DataCard>
          </Col>
        </Col>
      </Row>
      <Row className="justify-content-between w-100 px-5 mx-0 my-20">
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            haveContent
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            titleSec="Sobre mi"
            formNumber={1}
            editPath={about_user.edit_path}
          >
            <ProfileDefault fields={{ ...about_user.fields }} />
          </DataCard>
        </Col>
        <Col className="py-10" xs={12} sm={12} lg={6}>
          <DataCard
            headerKind="titleNoIconChipFav"
            actions
            editInfo
            titleSec="Intereses"
            haveContent
            editPath={user_interests.edit_path}
          >
            <ProfileDefault fields={{ ...user_interests.fields }} />
          </DataCard>
        </Col>
      </Row>
    </>
  )
}

export default FirstSection

FirstSection.propTypes = {
  basic_info: PropTypes.object.isRequired,
  about_user: PropTypes.object.isRequired,
  user_interests: PropTypes.object.isRequired
}
