const path = require('path')
const webpack = require('webpack')
const { environment } = require('@rails/webpacker')
const TerserPlugin = require('terser-webpack-plugin')
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

environment.splitChunks(config => ({
  ...config,
  optimization: {
    minimizer: [
      new TerserPlugin({
        cache: true
      })
    ],
    runtimeChunk: 'single',
    splitChunks: {
      chunks: 'all',
      maxSize: 600000,
      cacheGroups: {
        defaultVendors: {
          test: /[\\/]node_modules[\\/]/,
          reuseExistingChunk: true
        }
      }
    }
  }
}))

environment.loaders.prepend('typescript', typescript)
module.exports = environment
