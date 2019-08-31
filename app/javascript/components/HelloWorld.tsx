import * as React from "react"
import * as PropTypes from "prop-types"

interface CustomHelloWorldProps {
  greeting: string;
}

export default class HelloWorld extends React.Component<CustomHelloWorldProps> {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}
