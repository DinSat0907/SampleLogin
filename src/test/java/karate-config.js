function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    headless: karate.properties['headless'],   
    email: karate.properties['email'],
    password: karate.properties['password']
  }
  return config;
}