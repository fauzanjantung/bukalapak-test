class SignupPage

  # Selectors

  # Main
  BUKALAPAK_LOGO = {class: 'logo'}
  SIGNUP_HEADER_TEXT = {xpath: '//body/main[1]/div[1]/div[2]/section[1]/p[1]'}
  HP_OR_EMAIL_FIELD = { xpath: '//body/main[1]/div[1]/div[2]/section[1]/div[1]/div[1]/div[1]/input[1]' }
  INPUT_EXAMPLE_TEXT = {xpath: '//body/main[1]/div[1]/div[2]/section[1]/div[1]/div[2]/div[1]/p[1]'}
  DAFTAR_BUTTON = { xpath: '//body/main[1]/div[1]/div[2]/section[1]/div[2]/button[1]' }
  ALTERNATIVE_LOGIN_TEXT = {xpath: '//body/main[1]/div[1]/div[2]/section[1]/p[2]'}
  FACEBOOK_BUTTON = {xpath: '//body/main[1]/div[1]/div[2]/section[1]/div[3]/div[1]/div[1]/button[1]'}
  GOOGLE_BUTTON = {xpath: '//body/main[1]/div[1]/div[2]/section[1]/div[3]/div[1]/div[2]/button[1]'}
  LOGIN_TEXT = {xpath:'//body/main[1]/div[1]/div[2]/section[1]/div[5]/p[1]'}
  LOGIN_BUTTON = {css:'html > body > main > div > div:nth-of-type(2) > section > div:nth-of-type(5) > p > a'}

  # Modal
  MODAL = {xpath:'//section[1]/div[1]/div[2]/div[1]/div[1]/div[1]'}
  MODAL_HEADER_TEXT = {xpath:'//section[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/p[1]'}
  CLOSE_BUTTON = {css:'section > div > div:nth-of-type(2) > div > div > div > div:nth-of-type(2) > svg'}
  KONFIRMASI_EMAIL_TEXT = {xpath:'//section[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/p[1]'}
  KODE_RAHASIA_TEXT = {xpath:'//section[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/p[2]'}
  MODAL_SVG = {xpath:'//section[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]'}
  GANTI_HP_OR_EMAIL_BUTTON = { xpath: '//section[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/button[2]/span[1]'}
  KIRIM_KODE_BUTTON = {xpath: '//section[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/button[1]'}

  attr_reader :driver

  # class methods
  def initialize(driver)
    @driver = driver
  end

  def assert_elements_in_signup_page()
    @driver.find_element(BUKALAPAK_LOGO)
    @driver.find_element(SIGNUP_HEADER_TEXT)
    @driver.find_element(HP_OR_EMAIL_FIELD)
    @driver.find_element(INPUT_EXAMPLE_TEXT)
    @driver.find_element(DAFTAR_BUTTON)
    @driver.find_element(ALTERNATIVE_LOGIN_TEXT)
    @driver.find_element(FACEBOOK_BUTTON)
    @driver.find_element(GOOGLE_BUTTON)
    @driver.find_element(LOGIN_TEXT)
    @driver.find_element(LOGIN_BUTTON)
  end

  def get_signup_header_text()
    signup_header_text = @driver.find_element(SIGNUP_HEADER_TEXT)
    signup_header_text.text
  end

  def get_input_example_text()
    input_example_text = @driver.find_element(INPUT_EXAMPLE_TEXT)
    input_example_text.text
  end

  def get_alternative_login_text()
    alternative_login_text = @driver.find_element(ALTERNATIVE_LOGIN_TEXT)
    alternative_login_text.text
  end

  def get_login_text()
    login_text = @driver.find_element(LOGIN_TEXT)
    login_text.text
  end

  def enter_hp_or_email(hp_or_email)
    hp_or_email_field = @driver.find_element(HP_OR_EMAIL_FIELD)
    hp_or_email_field.send_keys(hp_or_email)
    sleep(1)
  end

  def click_daftar_button()
    daftar_button = @driver.find_element(DAFTAR_BUTTON)
    daftar_button.click
    sleep(1)
  end

  def assert_elements_in_modal()
    @driver.find_element(MODAL)
    @driver.find_element(MODAL_HEADER_TEXT)
    @driver.find_element(CLOSE_BUTTON)
    @driver.find_element(KONFIRMASI_EMAIL_TEXT)
    @driver.find_element(KODE_RAHASIA_TEXT)
    @driver.find_element(MODAL_SVG)
    @driver.find_element(GANTI_HP_OR_EMAIL_BUTTON)
    @driver.find_element(KIRIM_KODE_BUTTON)
  end

  def get_modal_header_text()
    modal_header_text = @driver.find_element(MODAL_HEADER_TEXT)
    modal_header_text.text
  end

  def get_konfirmasi_email_text()
    konfirmasi_email_text = @driver.find_element(KONFIRMASI_EMAIL_TEXT)
    konfirmasi_email_text.text
  end

  def get_kode_rahasia_text()
    kode_rahasia_text = @driver.find_element(KODE_RAHASIA_TEXT)
    kode_rahasia_text.text
  end

  def click_kirim_kode_button()
    kirim_kode_button = @driver.find_element(KIRIM_KODE_BUTTON)
    kirim_kode_button.click
    sleep(1)
  end

  def click_close_button()
    close_button = @driver.find_element(CLOSE_BUTTON)
    close_button.click
    sleep(1)
  end

  def click_login_button()
    login_button = @driver.find_element(LOGIN_BUTTON)
    login_button.click
    sleep(1)
  end

end
