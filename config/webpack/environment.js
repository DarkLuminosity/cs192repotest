const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
	$: 'jquery',
	jQuery: 'jquery',
	Popper: ['popper.js', 'default']
}))
//changes any instance of variables to jquery and popper.js for bootstrap
module.exports = environment
