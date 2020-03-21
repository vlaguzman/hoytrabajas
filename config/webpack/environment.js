const path = require('path')
const webpack = require('webpack')
const { environment } = require('@rails/webpacker')
const typescript = require('./loaders/typescript')

environment.plugins.prepend(
  'MomentContextReplacement',
  new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /en|es/)
)

environment.config.merge({
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        loader: 'babel-loader',
        exclude: [path.resolve(__dirname, 'node_modules')]
      }
    ]
  }
})

environment.loaders.prepend('typescript', typescript)
module.exports = environment
