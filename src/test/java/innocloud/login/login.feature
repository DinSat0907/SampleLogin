Feature: Test Login API

Background:
  * url innoCloudPostServices 
  
Scenario: Invalid Login with no appropriate HTTP Headers

  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": #(username), "PASSWORD": #(password)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'

  When method POST
  Then status 200
  Then print response

  And match response.Output.__type == "com.amazon.coral.service#UnknownOperationException"
  And match response.Version == "1.0"


Scenario: InValid Login with no ClientId
  
  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": "", "AuthParameters": { "USERNAME": #(username), "PASSWORD": #(password)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'
  
  When method POST
  Then status 400
  Then print response
  
  And match response.__type == "InvalidParameterException"
  And match response.message == "2 validation errors detected: Value '' at 'clientId' failed to satisfy constraint: Member must have length greater than or equal to 1; Value '' at 'clientId' failed to satisfy constraint: Member must satisfy regular expression pattern: [\\w+]+"


Scenario: InValid Login with no UserName and no Password
  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": "", "PASSWORD": ""}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 400
  Then print response

  And match response.__type == "InvalidParameterException"
  And match response.message == "Missing required parameter USERNAME"


Scenario: InValid Login with no Password

  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": #(username), "PASSWORD": ""}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 400
  Then print response

  And match response.__type == "InvalidParameterException"
  And match response.message == "Missing required parameter PASSWORD"


Scenario: InValid Login with no UserName

  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": "", "PASSWORD": #(password)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 400
  Then print response

  And match response.__type == "InvalidParameterException"
  And match response.message == "Missing required parameter USERNAME"


Scenario: InValid Login with incorrect UserName

Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": #(user), "PASSWORD": #(password)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 400
  Then print response

  And match response.__type == "UserNotFoundException"
  And match response.message == "User does not exist."


Scenario: InValid Login with incorrect Password

  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": #(username), "PASSWORD": #(pass)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 400
  Then print response

  And match response.__type == "NotAuthorizedException"
  And match response.message == "Incorrect username or password."


Scenario: Valid Login with apropriate HTTP Headers, ClintId, UserName, Password

  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": #(clientId), "AuthParameters": { "USERNAME": #(username), "PASSWORD": #(password)}}

  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
  And header Content-Type = 'application/x-amz-json-1.1'

  When method POST
  Then status 200
  Then print response

  And match response.AuthenticationResult.AccessToken == "#string"
  And match response.AuthenticationResult.ExpiresIn == 3600
  And match response.AuthenticationResult.IdToken == "#string"
  And match response.AuthenticationResult.NewDeviceMetadata.DeviceGroupKey == "#string"
  And match response.AuthenticationResult.NewDeviceMetadata.DeviceKey == "#string"
  And match response.AuthenticationResult.RefreshToken == "#string"
  And match response.AuthenticationResult.TokenType == "Bearer"
  And match response.ChallengeParameters == {}