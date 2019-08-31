import React from 'react'
import PropTypes from 'prop-types'
import { withRouter } from 'next/router'
import Link from 'next/link'
import clsx from 'clsx'
import MuiLink from '@material-ui/core/Link'

const NextComposed = React.forwardRef(function NextComposed(props, ref) {
  const { as, href, prefetch, ...other } = props

  return (
    <Link href={href} prefetch={prefetch} as={as}>
      <a ref={ref} {...other} />
    </Link>
  )
})

NextComposed.propTypes = {
  as: PropTypes.string,
  href: PropTypes.string,
  prefetch: PropTypes.bool
}

// A styled version of the Next.js Link component:
// https://nextjs.org/docs/#with-link
function MyLink(props) {
  const {
    activeClassName,
    router,
    className: classNameProps,
    innerRef,
    naked,
    ...other
  } = props

  const className = clsx(classNameProps, {
    [activeClassName]: router.pathname === props.href && activeClassName
  })

  if (naked) {
    return <NextComposed className={className} ref={innerRef} {...other} />
  }

  return (
    <MuiLink
      component={NextComposed}
      className={className}
      ref={innerRef}
      {...other}
    />
  )
}

MyLink.propTypes = {
  activeClassName: PropTypes.string,
  as: PropTypes.string,
  className: PropTypes.string,
  href: PropTypes.string,
  innerRef: PropTypes.oneOfType([PropTypes.func, PropTypes.object]),
  naked: PropTypes.bool,
  onClick: PropTypes.func,
  prefetch: PropTypes.bool,
  router: PropTypes.shape({
    pathname: PropTypes.string.isRequired
  }).isRequired
}

MyLink.defaultProps = {
  activeClassName: 'active'
}

const RouterLink = withRouter(MyLink)

export default React.forwardRef((props, ref) => (
  <RouterLink {...props} innerRef={ref} />
))
