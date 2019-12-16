import React from 'react'
import PropTypes from 'prop-types'
import { wordsShortener } from '../../../../helpers'

const posts = [
  {
    name: 'HoyTrabajas OnDemand',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-on-demand.jpg',
    description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  },
  {
    name: 'HoyTrabajas Flexy',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-flexi.jpg',
    description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  },
  {
    name: 'HoyTrabajas Línea Ejecutiva',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-linea-ejecutiva',
    description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
  }
]

const PostList = ({ translations }) => {
  return (
    <div className="t-home__postList">
      <h4 className="color__blue-main mb-60">{translations.title}</h4>
      <div className="postListGrid">
        {posts.map(post => (
          <div className="a-shadow__card singlePost">
            <p className="a-badge__service">{post.name}</p>
            <img src={post.imagePath} alt="Post Thumbnail" />
            <p className="mt-20 px-20">
              {wordsShortener(post.description, 120)}
            </p>
            <a
              className="my-20 px-20 color__blue-main fw-bold"
              href={post.path}
            >
              {translations.btn_see_more}
            </a>
          </div>
        ))}
      </div>
    </div>
  )
}

PostList.propTypes = {
  translations: PropTypes.shape({
    title: PropTypes.string.isRequired,
    btn_see_more: PropTypes.string.isRequired
  }).isRequired
}

export default PostList
