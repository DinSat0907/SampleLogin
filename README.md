# karate-ui-test

This README file provides instructions on how to set up, configure, and execute UI tests for a login webpage using Karate.

## Table of Contents
- Introduction
- Pre-requisites
- Installation and Project SetUp
- Running Tests 
- Test Scenarios
- Troubleshooting
- Conclusion

## Introduction

Karate is an open-source framework designed for API and UI testing. This guide demonstrates how to use Karate for testing various scenarios of a web application's login page.

## Pre-requisites

Before you begin, ensure you have the following installed:
- [Java](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Apache Maven](https://maven.apache.org/install.html)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Karate Runner for VS Code](https://marketplace.visualstudio.com/items?itemName=kirkslota.karate-runner)
- [Chrome Browser](https://www.google.com/chrome/what-you-make-of-it/T1rVN-GzPtFce8VSVWkmHEfNJfNOTXmaZxRoCaNgQAvD_BwE&gclsrc=aw.ds)
- [ChromeDriver (compatible with your Chrome version)](https://developer.chrome.com/docs/chromedriver/downloads)

## Installation and Project SetUp

1. **Open the project in VS Code**:
    - Go to the working directory, use this commend to open the VS Code:
    ```bash
    code .
    ```
2. **Clone the repository**:
    - Open the terminal in VS Code, use this commend to clone the project
    ```bash
    git clone https://github.com/SmartSchoolMIS/karate-ui-test.git
    cd karate-ui-test
    ```

3. **Install the dependencies**:
    - Open the terminal in VS Code and run:
    ```bash
    mvn clean install
    ```

## Running Tests

To run the tests, you need to provide the `email` and `password` as environment variables.

1. **Run the tests**:
    - Open the feature file (`login.feature`).
    - you can run the tests using Maven:
     ```bash
     mvn test -Demail=email -Dpassword=password -Dheadless=
     ```

    Replace `Your_email` and `Your_Password` with your actual values.

    - If you wnat run the tests in headless mode using Maven:
     ```bash
     mvn test -Demail=email -Dpassword=password -Dheadless=--headless=new
     ```

    Replace `Your_email` and `Your_Password` with your actual values.

## Test Scenarios

The project contains various test scenarios for the login API:

1. **No Email and No Password**
2. **Incorrect Email and No Password**
3. **No Email and Incorrect password**
4. **Incorrect Email and Incorrect Password**
5. **Correct Email and Incorrect Password**
6. **Incorrect Email and Correct Password**
7. **Correct Email and Correct Password**

Each scenario is defined in the `login.feature` file and uses placeholders for `email` and `password` which are populated from the environment variables.

## Troubleshooting

### Common Issues
- **ChromeDriver Version Mismatch:** Ensure ChromeDriver matches your Chrome browser version.
- **Port Conflicts:** Check if the specified ports are available and not blocked.
- **Headless Mode Issues:** Run tests without headless mode for debugging purposes.
- **Network Issues:** Ensure your machine has network access to the application URL.

## Conclusion

This README provides a comprehensive guide to set up and run UI tests using Karate for a web application's login page. By following the steps and troubleshooting tips, you should be able to create and execute reliable UI tests.