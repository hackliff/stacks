const Generator = require('yeoman-generator')

module.exports = class extends Generator {
  // The name `constructor` is important here
  constructor(args, opts) {
    // Calling the super constructor is important so our generator is correctly set up
    super(args, opts);

    // Next, add your custom code
    this.option('foo', { default: 'bar', alias: 'f' }) // This method adds support for a `--babel` flag

    this.argument('spider', { type: String, required: true, desc: 'spider name' })

    this.log(this.options.spider)
    this.log(this.options.foo)
  }

  prompting() {
    return this.prompt([{
      type    : 'input',
      name    : 'name',
      message : 'Your project name',
      default : this.appname // Default to current folder name
    }, {
      type    : 'confirm',
      name    : 'cool',
      message : 'Would you like to enable the Cool feature?'
    }]).then((answers) => {
      this.log('app name', answers.name);
      this.log('cool feature', answers.cool);
    })
  }

  writing() {
    this.fs.copyTpl(
      this.templatePath('spider.py'),
      this.destinationPath('index.html'),
      { title: 'MarineTraffic' }
    );
  }

  method1() {
    this.log('scalfolding project in', this.destinationRoot())
  }

  method2() {
  	this.log('method 2 just ran')
  }
}
