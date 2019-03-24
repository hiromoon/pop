const path = require('path');

module.exports = {
  mode: 'development',
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'public'),
  },
  devServer: {
    contentBase: path.join(__dirname, 'public'),
    port: 8080,
    historyApiFallback: true,
    hot: false,
    inline: true,
    proxy: {
      '/api': 'http://localhost:3000',
      '/admin/api': 'http://localhost:3000',
    },
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'babel-loader',
          },
        ],
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  devtool: 'inline-source-map',
};
