import React from 'react'
import PropTypes from 'prop-types'

const posts = [
  {
    key: 'ondemand',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-on-demand.jpg'
  },
  {
    key: 'flexi',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-flexi.jpg'
  },
  {
    key: 'company_prime',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-linea-ejecutiva.jpg'
  }
]

const PostList = ({ translations }) => {
  const { title, btn_see_more, content } = translations
  return (
    <div className="t-home__postList">
      <h4 className="postList__title color__blue-main">{title}</h4>
      <div className="postListGrid">
        {posts.map(post => (
          <div
            key={post.key}
            className="a-shadow__card singlePost d-flex flex-column"
          >
            <p className="a-badge__service">{content[post.key].tag}</p>
            <img src={post.imagePath} alt="Post Thumbnail" />
            <p className="mt-20 px-20" style={{ textAlign: 'justify' }}>
              {content[post.key].description}
            </p>
            <a
              className="mt-auto p-20 color__blue-main fw-bold"
              // TODO any: replace when we have a real link inside each object
              // href={post.path}
              href="mailto:operaciones@hoytrabajas.com"
            >
              {btn_see_more}
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
    content: PropTypes.shape({
      ondemand: PropTypes.object.isRequired,
      flexi: PropTypes.object.isRequired,
      company_prime: PropTypes.object.isRequired
    }).isRequired,
    btn_see_more: PropTypes.string.isRequired
  }).isRequired
}

export default PostList
