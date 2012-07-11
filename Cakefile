{exec} = require 'child_process'



option '-e', '--environment [ENVIRONMENT_NAME]', 'set environment'

task 'dependencies', 'Download required libraries', (options) ->

  options.environment or= 'development'

  devDependencies = 
    backbone: 'http://backbonejs.org/backbone.js' 
    jquery: 'http://code.jquery.com/jquery-1.7.2.js'
    underscore: 'http://underscorejs.org/underscore.js' 

  testDependencies = 
    # jasmine installation process is too complicated at the moment
    sinon: 'http://sinonjs.org/releases/sinon-1.4.0.js'
    jasmineSinon: 'https://raw.github.com/froots/jasmine-sinon/master/lib/jasmine-sinon.js'

  prodDependencies =
    backbone: 'http://backbonejs.org/backbone-min.js'
    jquery: 'http://code.jquery.com/jquery-1.7.2.min.js'
    underscore: 'http://documentcloud.github.com/underscore/underscore-min.js'

  downloadDependencies = (name, url, dir='js/vendor') ->
    console.log "Downloading " + name + ' from  ' + url
    command = "curl -o #{dir}/#{name}.js #{url}"
    exec command, (err, stdout, stderr) ->
      throw err if err
      console.log stdout + stderr

  if options.environment == 'development'
    downloadDependencies name, url for name, url of devDependencies
    downloadDependencies name, url, 'js/spec/vendor' for name, url of testDependencies
  else if options.enviornment == 'production'
    downloadDependencies name, url for name, url  of prodDependencies

option '-b', '--browser [BROWSER_NAME]', 'set browser for running specs' 

task 'spec', 'Run Jasmine Specs in specified browser (Firefox default)', (options) ->
  options.browser or= 'Firefox'
  exec "open -a #{options.browser} SpecRunner.html"
