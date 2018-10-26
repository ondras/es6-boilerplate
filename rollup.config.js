import includePaths from "rollup-plugin-includepaths";

export default {
	output: {
	    format: "iife"
	},
    plugins: [ includePaths({paths:["js/"]})]
}
