var system = require('system'), 
    casper = require('casper').create({ verbose: false, logLevel: "debug"}), 
    loginInfo, urls;
    results = []
    
loginInfo = casper.cli.options;
urls = casper.cli.args;

casper.start(loginInfo.url, function() {
  options = {};
  options[loginInfo.usernameField] = loginInfo.username;
  options[loginInfo.passwordField] = loginInfo.password;
  this.fill(loginInfo.loginForm, options, true);
});


urls.forEach(function(url) {
  casper.then(function() {
    t = Date.now();
    result = { url: url, startedAt: new Date(t)};
    casper.on('load.failed', function(){
      result.status = 'loadFailed';
    });
    casper.open(url).then(function() {
      s = Date.now() - t;
      result.loadTime = s;
      // console.log('Started at ' + new Date(t) + ' Loading time ' + s + ' msec');
    });
    results.push(result);
  });    
});

casper.run(function() {
  results_string = JSON.stringify(results);
  this.echo(results_string).exit();
});