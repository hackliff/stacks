module.exports = function (plop) {
	// create your generators here
	plop.setGenerator('spider', {
		description: 'this is a skeleton plopfile',

		prompts: [{
			type: 'input',
			name: 'name',
			message: 'spider name please',
		}],

		actions: [{
			type: 'add',
			path: '{{name}}.js',
			templateFile: 'templates/spider.hbs',
		}]
	})
}
