# Karate API Testing Project

This project contains a suite of tests for the login API of the `innoCloudPostServices` application, written using the Karate testing framework and run within Visual Studio Code (VS Code).

## Prerequisites

Before you begin, ensure you have the following installed:
- [Java](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Apache Maven](https://maven.apache.org/install.html)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Karate Runner for VS Code](https://marketplace.visualstudio.com/items?itemName=kirkslota.karate-runner)

## Project Setup

1. **Open the project in VS Code**:
    - Go to the working directory, use this commend to open the VS Code:
    ```bash
    code .
    ```
2. **Clone the repository**:
    - Open the terminal in VS Code, use this commend to clone the project
    ```bash
    git clone https://github.com/your-username/karate-api-testing.git
    cd karate-api-testing
    ```

3. **Install the dependencies**:
    - Open the terminal in VS Code and run:
    ```bash
    mvn clean install
    ```

## Running the Tests

To run the tests, you need to provide the `innoCloudPostServices`,`clientId`, `username`, and `password` as environment variables.

1. **Run the tests**:
    - Open the feature file (`login.feature`).
    - you can run the tests using Maven:
     ```bash
     mvn test -DinnoCloudPostServices=url -DclientId=clientId -Dusername=username -Dpassword=password
     ```

    Replace `Your_url`, `Your_clientId`, `Your_username` and `Your_Password` with your actual values.

## Test Scenarios

The project contains various test scenarios for the login API:

1. **Invalid Login with no appropriate HTTP Headers**
2. **Invalid Login with no ClientId**
3. **Invalid Login with no UserName and no Password**
4. **Invalid Login with no Password**
5. **Invalid Login with no UserName**
6. **Invalid Login with incorrect UserName**
7. **Invalid Login with incorrect Password**
8. **Valid Login with appropriate HTTP Headers, ClientId, UserName, and Password**

Each scenario is defined in the `login.feature` file and uses placeholders for `clientId`, `username`, and `password` which are populated from the environment variables.

### Example Feature File

Feature: Test Login API

Background:
  * url innoCloudPostServices

Scenario: Invalid Login with no appropriate HTTP Headers
  Given request { "AuthFlow": "USER_PASSWORD_AUTH", "ClientId": "#(clientId)", "AuthParameters": { "USERNAME": "#(username)", "PASSWORD": "#(password)"}}
  And header User-Agent = 'PostmanRuntime/7.39.0'
  And header Accept = '*/*'
  And header Accept-Encoding = 'gzip, deflate, br'
  And header Connection = 'keep-alive'
  
  When method POST
  Then status 200
  Then print response

  And match response.Output.__type == "com.amazon.coral.service#UnknownOperationException"
  And match response.Version == "1.0"

# Additional scenarios follow...
