import React from 'react'
import PropTypes from 'prop-types'

const posts = [
  {
    name: 'HoyTrabajas OnDemand',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-on-demand.jpg',
    description:
      'Publica tus ofertas de trabajo y encuentra el mejor talento. HoyTrabajas.com OnDemand te da mejor visibilidad de tus ofertas y te entregamos candidatos afines al puesto de trabajo.'
  },
  {
    name: 'HoyTrabajas Flexi',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-flexi.jpg',
    description:
      'Contrata personal por turnos rápido y fácil. HoyTrabajas.com Flexi, conecta a tu empresa con trabajadores por turnos con experiencia entrevistados, validados y asegurados.'
  },
  {
    name: 'HoyTrabajas Línea Ejecutiva',
    path: '/',
    imagePath: '/assets/static/img/hoytrabajas-linea-ejecutiva.jpg',
    description:
      'Encuentra el talento adecuado para tu empresa. HoyTrabajas.com línea Ejecutiva te ayuda en los procesos de reclutamiento, evaluación, selección y desarrollo de talentos.'
  }
]

const PostList = ({ translations }) => {
  return (
    <div className="t-home__postList">
      <h4 className="color__blue-main mb-60">{translations.title}</h4>
      <div className="postListGrid">
        {posts.map(post => (
          <div className="a-shadow__card singlePost d-flex flex-column">
            <p className="a-badge__service">{post.name}</p>
            <img src={post.imagePath} alt="Post Thumbnail" />
            <p className="mt-20 px-20" style={{ textAlign: 'justify' }}>
              {post.description}
            </p>
            <a
              className="mt-auto p-20 color__blue-main fw-bold"
              // TODO any: replace when we have a real link inside each object
              // href={post.path}
              href="mailto:operaciones@hoytrabajas.com"
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
