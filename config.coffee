exports.config =
  # See docs at http://brunch.readthedocs.org/en/latest/config.html.
  conventions:
    ignored: ///^(
        vendor.*\.less    # exclude vendor less files, cause them must be css already
        |.+node_modules.+ # exclude all entities from node_modules
        |.+_.+\..+)$      # exclude all entities with '_' before file extension
      ///
  modules:
    definition: false
    wrapper: false
  paths:
    public: '_public'
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^vendor/
        'test/scenarios.js': /^test(\/|\\)e2e/
      order:
        before: [
          'vendor/console-polyfill/index.js'
          'vendor/angular/angular.js'          
          'vendor/angular-resource/angular-resource.js'          
          'vendor/angular-cookies/angular-cookies.js'          
          'vendor/angular-sanitize/angular-sanitize.js'                    
        ]

    stylesheets:
      joinTo:
        'css/app.css': /^(app|vendor)/
      order:
        before: [
          'vendor/styles/foundation-4.2.2/normalize.css'
          'vendor/styles/foundation-4.2.2/foundation.css'
        ]

    templates:
      joinTo: 
        'js/dontUseMe' : /^app/ # dirty hack for Jade compiling.

  plugins:
    jade:
      pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
    jade_angular:
      modules_folder: 'partials'
      locals: {}

    bower:
      extend:
        "jquery" : []
        "lesshat" : []
        "angular-mocks": []
        "styles": []
        "scripts": []
      asserts:
        "img" : /bootstrap(\\|\/)img/
        "font": /font-awesome(\\|\/)font/


  # Enable or disable minifying of result js / css files.
  # optimize: true
