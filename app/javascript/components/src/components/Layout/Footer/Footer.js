import React, {Fragment, useState, useRef} from 'react'
import UpperFooter from './UpperFooter'
import UnderFooter from './UnderFooter'
import SocialBar from './socialBar'
import { Collapse, Button, Row } from 'reactstrap';


const Footer = ({scrollToBottom}) => {
  const [state, setState] = useState({collapse: true});

  const scrol = () => {
    setState({ collapse: !state.collapse })
    if (state.collapse) {
        // scrollToBottom()
    } 
  }
  return (
    <Fragment>
      <Row noGutters className='position-relative'>
        <Button className='position-absolute d-none'
         color="primary" onClick={scrol}
          style={{left: '50%', marginBottom: '3rem', zIndex: '99'}}>
          Toggle
        </Button>
      </Row>
      <Collapse isOpen={state.collapse}>
      <div className="rct-footer d-flex flex-column bg-image animated fadeIn">
        <SocialBar />
        <UpperFooter />
        <UnderFooter  />
      </div>
      </Collapse>
    </Fragment>
  )
}

export default Footer
