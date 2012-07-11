{exec} = require 'child_process'
fs     = require 'fs'

option '-b', '--browser [BROWSER_NAME]', 'set browser for running specs' 
option '-d', '--directory [DIRECTORY_NAME]', 'specify a directory to build compile coffescript files'
option '-e', '--environment [ENVIRONMENT_NAME]', 'set environment'
option '-o', '--output [OUTPUT_DIR]', 'specifiy the file the coffescript will compile to'

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

task 'spec', 'Run Jasmine Specs in specified browser (Firefox default)', (options) ->
  options.browser or= 'Firefox'
  exec "open -a #{options.browser} SpecRunner.html", (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'build', 'Concat and Compile all .coffee files in a directory', (options) ->
  options.directory or= 'coffee'
  options.output or= 'js/App.js'
  [outDir..., outName] = options.output.split '/'
  outDir = outDir.join '/'
  [outName] = outName.split '.'
  coffeeFiles = new Array

  traverseFileSystem = (path) ->
    files = fs.readdirSync path
    for file in files
      do (file) ->
        currentFile = "#{path}/#{file}"
        stats = fs.statSync currentFile
        if stats.isFile() and currentFile.indexOf '.coffee' > 1 and coffeeFiles.join('=').indexOf("#{currentFile}=") < 0
          coffeeFiles.push currentFile
        else if stats.isDirectory()
          traverseFileSystem currentFile

  process = ->
    fs.writeFile "temp/#{outName}.coffee", coffeeContents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      command = "coffee --output #{outDir} --compile temp/#{outName}.coffee"
      exec command, (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink "temp/#{outName}.coffee", (err) ->
          throw err if err
          console.log 'Build Complete'

  traverseFileSystem options.directory

  console.log coffeeFiles

  coffeeContents = new Array remaining = coffeeFiles.length
  
  for file, index in coffeeFiles then do (file, index) ->
    fs.readFile file, 'utf8', (err, fileContents) ->
      throw err if err
      coffeeContents[index] = fileContents
      process() if --remaining is 0

task 'build:spec', 'builds jasmine spec files', (options) ->
  options.directory = 'spec'
  options.output = 'js/spec/Spec.js'
  invoke 'build'
