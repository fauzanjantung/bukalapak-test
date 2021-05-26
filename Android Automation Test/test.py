__author__ = 'Fauzan Fathurrahman'
import os
import unittest
from appium import webdriver
from time import sleep
from datetime import datetime

class RegisterAndLogin(unittest.TestCase):

    now = datetime.now().strftime("%H%M%S")
    fullname = f'Fauzan{now}'
    email = f'f{now}@gmail.com'
    wrongPassword = '123'
    correctPassword = 'Bukalapak,$1,%2,&3!'

    def setUp(self):
        desired_caps = {}
        desired_caps['platformName'] = 'Android'
        desired_caps['platformVersion'] = '10'
        desired_caps['deviceName'] = '26ab365'
        desired_caps['app'] = 'C:\\test.apk'
        desired_caps['appPackage'] = 'com.loginmodule.learning'
        desired_caps['appActivity'] = 'com.loginmodule.learning.activities.LoginActivity'
        self.driver = webdriver.Remote('http://localhost:4444/wd/hub', desired_caps)

    def test_register_and_login(self):

        # Get rid of the autofill suggestion
        sleep(3)
        self.driver.tap([(100, 100),(50,50)])
        sleep(1)

        # Go to register page
        registerLink = self.driver.find_element_by_id("com.loginmodule.learning:id/textViewLinkRegister")
        registerLink.click()

        # Get rid of the autofill suggestion
        sleep(3)
        self.driver.tap([(100, 100),(50,50)])
        sleep(1)

        # Find objects
        logo = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/android.widget.ImageView')
        nameFieldText = self.driver.find_element_by_id('com.loginmodule.learning:id/textInputLayoutName').text
        nameField = self.driver.find_element_by_id('com.loginmodule.learning:id/textInputEditTextName')
        emailFieldText = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputLayoutEmail").text
        emailField = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputEditTextEmail")
        passwordFieldText = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputLayoutPassword").text
        passwordField = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputEditTextPassword")
        confirmPasswordFieldText = self.driver.find_element_by_id('com.loginmodule.learning:id/textInputLayoutConfirmPassword').text
        confirmPasswordField = self.driver.find_element_by_id('com.loginmodule.learning:id/textInputEditTextConfirmPassword')
        registerButton = self.driver.find_element_by_id('com.loginmodule.learning:id/appCompatButtonRegister')

        # Try to register without inputting anything
        registerButton.click()
        EmptyNameAlert = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[1]/android.widget.LinearLayout/android.widget.TextView').text
        expectedEmptyNameFieldAlert = 'Enter Full Name'

        # Compare empty name field alert with expected value
        self.assertEqual(EmptyNameAlert, expectedEmptyNameFieldAlert)

        # Get rid of the autofill suggestion
        sleep(3)
        self.driver.tap([(100, 100),(50,50)])
        sleep(1)

        # Input Fullname
        nameField.send_keys(RegisterAndLogin.fullname)

        # Scroll to bottom
        self.driver.swipe(150, 400, 150, 200, 1000)

        # Click register button without inputting email
        registerButton.click()

        emailNotValidAlert = self.driver.find_element_by_xpath("//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[2]/android.widget.LinearLayout/android.widget.TextView").text
        expectedEmailNotValidAlert = "Enter Valid Email"

        # Compare email not valid alert with expected value
        self.assertEqual(emailNotValidAlert, expectedEmailNotValidAlert)

        # Input email
        emailField.send_keys(RegisterAndLogin.email)

        # Register but password and confirmation value is different
        passwordField.send_keys(RegisterAndLogin.correctPassword)
        confirmPasswordField.send_keys(RegisterAndLogin.wrongPassword)
        registerButton.click()

        passwordNotSameAlert = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[4]/android.widget.LinearLayout/android.widget.TextView').text
        expectedPasswordNotSameAlert = "Password Does Not Matches"

        # Compare password doesn't matches alert with expected value
        self.assertEqual(passwordNotSameAlert, expectedPasswordNotSameAlert)

        # Clear confirmation password field and input value that match with the password field and click register button
        confirmPasswordField.clear()
        confirmPasswordField.send_keys(RegisterAndLogin.correctPassword)

        registerButton.click()

        # Get rid of the autofill suggestion
        self.driver.tap([(100, 100),(50,50)])

        # Find and compare success alert
        registrationSuccessfulAlert = self.driver.find_element_by_id('com.loginmodule.learning:id/snackbar_text').text
        expectedRegistrationSuccessfulAlert = "Registration Successful"
        self.assertEqual(registrationSuccessfulAlert, expectedRegistrationSuccessfulAlert)
        sleep(3)

        # Compare link to login page text and go to login page
        loginLink = self.driver.find_element_by_id("com.loginmodule.learning:id/appCompatTextViewLoginLink")
        loginLinkText = self.driver.find_element_by_id("com.loginmodule.learning:id/appCompatTextViewLoginLink").text
        expectedLoginLinkText = "Already a member? Login"
        self.assertEqual(loginLinkText, expectedLoginLinkText)
        loginLink.click()

        # Get rid of the autofill suggestion
        sleep(3)
        self.driver.tap([(100, 100),(50,50)])
        sleep(1)
        
        # Find objects
        logo = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/android.widget.ImageView')
        titleText = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/android.widget.TextView[1]').text
        emailFieldText = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputLayoutEmail").text
        emailField = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputEditTextEmail")
        passwordFieldText = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputLayoutPassword").text
        passwordField = self.driver.find_element_by_id("com.loginmodule.learning:id/textInputEditTextPassword")
        loginButton = self.driver.find_element_by_id("com.loginmodule.learning:id/appCompatButtonLogin")
        registerText = self.driver.find_element_by_id("com.loginmodule.learning:id/textViewLinkRegister").text

        # Declare expected value
        expectedTitleText = "VERSION - V4"
        expectedEmailFieldText = "Email"
        expectedPasswordFieldText = "Password"
        expectedRegisterText = "No account yet? Create one"

        # Assert login page elements text
        self.assertEqual(titleText, expectedTitleText)
        self.assertEqual(emailFieldText, expectedEmailFieldText)
        self.assertEqual(passwordFieldText, expectedPasswordFieldText)
        self.assertEqual(registerText, expectedRegisterText)

        # Login without inputting email
        loginButton.click()
        emailNotValidAlert = self.driver.find_element_by_xpath("//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.ScrollView/android.support.v7.widget.LinearLayoutCompat/TextInputLayout[1]/android.widget.LinearLayout/android.widget.TextView").text
        expectedEmailNotValidAlert = "Enter Valid Email"

        # Compare alert with expected
        self.assertEqual(emailNotValidAlert, expectedEmailNotValidAlert)

        # Login with correct email and wrong password
        emailField.send_keys(RegisterAndLogin.email)
        passwordField.send_keys(RegisterAndLogin.wrongPassword)

        loginButton.click()
        wrongCredentialsAlert = self.driver.find_element_by_id("com.loginmodule.learning:id/snackbar_text").text
        expectedWrongCredentialsAlert = "Wrong Email or Password"

        # Compare alert with expected
        self.assertEqual(wrongCredentialsAlert, expectedWrongCredentialsAlert)

        # Clear password field and input correcr password
        passwordField.clear()
        passwordField.send_keys(RegisterAndLogin.correctPassword)
        loginButton.click()

        sleep(2)

        # Find objects at after login page
        afterLoginTitleText = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.TextView[1]').text
        afterLoginEmailText = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v7.widget.LinearLayoutCompat/android.widget.TextView[3]').text
        afterLoginNameText = self.driver.find_element_by_xpath('//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.support.v7.widget.RecyclerView/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.TextView[2]').text
        afterLoginEmailInAccountCardText = self.driver.find_element_by_id('com.loginmodule.learning:id/textViewEmail').text
        afterLoginPasswordText = self.driver.find_element_by_id('com.loginmodule.learning:id/textViewPassword').text

        # Compare after login elements text with expected values
        expectedAfterLoginTitleText = "Android NewLine Learning"
        self.assertEqual(afterLoginTitleText, expectedAfterLoginTitleText)
        self.assertEqual(afterLoginEmailText, RegisterAndLogin.email)
        self.assertEqual(afterLoginNameText, RegisterAndLogin.fullname)
        self.assertEqual(afterLoginEmailInAccountCardText, RegisterAndLogin.email)
        self.assertEqual(afterLoginPasswordText, RegisterAndLogin.correctPassword)

    def tearDown(self):
        self.driver.quit()

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(RegisterAndLogin)
    unittest.TextTestRunner(verbosity=2).run(suite)