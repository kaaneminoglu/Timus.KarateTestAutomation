Feature: login feature

  Background:
    * url baseUrl

  @Test
  Scenario: ST001.Enter valid email address & valid password
    * url baseUrl
    * path 'auth/admin'
    * request {"email": "berqnetfw@gmail.com", "password": "aB12345678.!", "correlation_id": null, "action": null, "platform": "karate", "version": "0.1", "token": null }
    * method POST
    * status 200
    * def token = response.results.token
    * match token == '#notnull'
    * path 'auth/admin'
    * header Authorization = 'Bearer ' + token
    * method GET
    * status 200

  @Test
  Scenario: ST002.Enter invalid email address & valid password
    * url baseUrl
    * path 'auth/admin'
    * request {"email": "aa", "password": "aB12345678.!", "correlation_id": null, "action": null, "platform": "karate", "version": "0.1", "token": null }
    * method POST
    * status 400
    * def description = response.messages[0].description
    * match description == "Wrong credentials. Please check your email or password."

  @Test
  Scenario: ST003.Enter valid email address & invalid password
    * url baseUrl
    * path 'auth/admin'
    * request {"email": "berqnetfw@gmail.com", "password": "a", "correlation_id": null, "action": null, "platform": "karate", "version": "0.1", "token": null }
    * method POST
    * status 400
    * def description = response.messages[0].description
    * match description == "Wrong credentials. Please check your email or password."

  @Test
  Scenario: ST004.Enter empty email address & empty password
    * url baseUrl
    * path 'auth/admin'
    * request {"email": "", "password": "", "correlation_id": null, "action": null, "platform": "karate", "version": "0.1", "token": null }
    * method POST
    * status 400
    * def description = response.messages[0].description
    * match description == "Wrong credentials. Please check your email or password."

  @Test
  Scenario: ST005.Enter null email address & null password
    * url baseUrl
    * path 'auth/admin'
    * request {"email": null, "password": null, "correlation_id": null, "action": null, "platform": "karate", "version": "0.1", "token": null }
    * method POST
    * status 400
    * def description = response.messages[0].description
    * match description == "Wrong credentials. Please check your email or password."