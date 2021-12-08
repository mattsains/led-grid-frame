const path = require('path');

module.exports = {
    entry: path.join(__dirname, 'index.tsx'),
    mode: 'development',
    devtool: 'source-map',
    devServer: {
        contentBase: path.join(__dirname)
    },
    resolve: { extensions: ['.ts', '.tsx', '.js', '.jsx', '.json'] },
    output: { filename: 'index_bundle.js' },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                loader: 'awesome-typescript-loader',
            },
            {
                test: /\.(svg|png|woff2?|ttf|eof|eot)$/,
                loader: 'file-loader',
            },
        ],
    }
}