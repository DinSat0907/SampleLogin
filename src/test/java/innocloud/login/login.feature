    @parallel=false
Feature: Karate UI Test for Login WebPage

  Background: 

    * configure driver = { type: 'chrome', addOptions: [#(headless)] } //If you want to change the headless mode, use this -Dheadless=--headless=new in the command line  headless mode or else give the null value

  Scenario:  No Email and No Password       
    
    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/' 
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']","")
    And input("//*[@placeholder='Password']","")
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'Please enter the valid email and password'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario:  Incorrect Email and No Password       

    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']","incorrect@email.com")
    And input("//*[@placeholder='Password']","")
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'Please enter the valid email and password'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario:  No Email and Incorrect password     
    
    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']","")
    And input("//*[@placeholder='Password']","Test@12345")
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'Please enter the valid email and password'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario:  Incorrect Email and Incorrect Password    
    
    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']","incorrect@email.com")
    And input("//*[@placeholder='Password']","Test@12345")
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'User does not exist.'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario:  Correct Email and Incorrect Password    
    
    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'       // Login page
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']",email)
    And input("//*[@placeholder='Password']","Test@12345")
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'Incorrect username or password.'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario:  Incorrect Email and Correct Password    
    
    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'       // Login page
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']","incorrect@email.com")
    And input("//*[@placeholder='Password']",password)
    When click("//*[@data-testid='login-btn']")
    Then match driver.text("//*[@data-testid='modal-error']") == 'User does not exist.'
    * delay(2000)
    And click("/html/body/div[4]/div/div[2]/div/div/div/div/div[2]/div")
    * delay(2000)
    * close()


  Scenario: Correct Email and Correct Password      

    Given driver 'https://main.d1t007v5o5u8rs.amplifyapp.com/'
    * maximize()
    * delay(3000)
    And match driver.title == 'Login'              
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[1]") == 'Account Log in'
    And match driver.text("//*[@id='root']/div/div/div/div/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div[2]") == 'Login to Contnue'       
    And input("//*[@placeholder='Email']",email)
    And input("//*[@placeholder='Password']",password)
    When click("//*[@data-testid='login-btn']")
    * delay(2000)
    * close()