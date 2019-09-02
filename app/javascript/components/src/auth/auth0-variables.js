export const AUTH_CONFIG = {
  domain: 'dev-o03rbp-q.auth0.com',
  clientId: 'IUg2Zi45fb313XlGLg57TPqBaJdsb0Yq',
  callbackUrl:
    process.env.NODE_ENV === 'development'
      ? 'http://localhost:3000/callback'
      : 'http://node.hoytrabajas.com/callback',
  returnTo:
    process.env.NODE_ENV === 'development'
      ? 'http://localhost:3000/'
      : 'http://node.hoytrabajas.com/'
}

export const API_CONFIG = {
  domain: 'staging.hoytrabajas.com'
}
