const path = require('path')
const webpack = require('webpack')
const { environment } = require('@rails/webpacker')
const CompressionPlugin = require('compression-webpack-plugin')
const BrotliPlugin = require('brotli-webpack-plugin')

const typescript = require('./loaders/typescript')

environment.plugins.prepend(
  'MomentContextReplacement',
  new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /en|es/)
)

environment.config.merge({
  plugins: [
    new CompressionPlugin({
      filename: '[path].gz[query]',
      algorithm: 'gzip',
      test: /\.(js|css|html|svg)$/,
      threshold: 10240,
      minRatio: 0.7
    }),
    new BrotliPlugin({
      asset: '[path].br[query]',
      test: /\.(js|css|html|svg)$/,
      threshold: 10240,
      minRatio: 0.7
    })
  ],
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
