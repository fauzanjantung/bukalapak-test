require "selenium-webdriver"
require "rspec"
require_relative "signup_page.rb"
require_relative "main_page.rb"
require_relative "search_page.rb"

# TEST: Sign up for Bukalapak
describe "Bukalapak Website" do
  describe "when user go to signup page"	do
  	it "creates a new user account successfully" do

      timestamp = Time.now.to_i
      emailSignUp = "blTest#{timestamp}@gmail.com"

      expected_signup_page_title = "Daftar Akun Bukalapak | Bukalapak"
      expected_signup_header_text = "Daftar dulu, yuk"
      expected_input_example_text = "Misal: 081234567890, atau nama@email.com"
      expected_alternative_login_text = "Bisa juga pakai"
      expected_login_text = "Sudah punya akun? Login"

      # Modal Signup Page
      expected_modal_header_text = "Verifikasi Pendaftaran"
      expected_konfirmasi_email_text = "Email kamu sudah benar?"
      expected_kode_rahasia_text = "Kode Rahasia akan dikirimkan ke #{emailSignUp} untuk proses verifikasi."

		  @driver = Selenium::WebDriver.for :firefox

      # Go to signup page
      @driver.navigate.to "https://accounts.bukalapak.com/register"

		  # Compare signup page title
      expect(@driver.title).to eq(expected_signup_page_title)

      signup = SignupPage.new(@driver)

      # Assert all key elements in signup page    
      signup.assert_elements_in_signup_page() 

      # Compare signup header text
      signup_header_text = signup.get_signup_header_text()
      expect(signup_header_text).to eq(expected_signup_header_text)

      # Compare signup input example text
      input_example_text = signup.get_input_example_text()
      expect(input_example_text).to eq(expected_input_example_text)

      # Compare signup alternative login text
      alternative_login_text = signup.get_alternative_login_text()
      expect(alternative_login_text).to eq(expected_alternative_login_text)

      # Compare signup login text
      login_text = signup.get_login_text()
      expect(login_text).to eq(expected_login_text)

      # Enter user email
      signup.enter_hp_or_email(emailSignUp)

      # Click daftar button
      signup.click_daftar_button()

      # Assert all key elements in modal
      signup.assert_elements_in_modal()

      # Compare modal header text
      modal_header_text = signup.get_modal_header_text()
      expect(modal_header_text).to eq(expected_modal_header_text)

      # Compare konfirmasi email text
      konfirmasi_email_text = signup.get_konfirmasi_email_text()
      expect(konfirmasi_email_text).to eq(expected_konfirmasi_email_text)

      # Compare kode rahasia text
      kode_rahasia_text = signup.get_kode_rahasia_text()
      expect(kode_rahasia_text).to eq(expected_kode_rahasia_text)

      # Click kirim kode button
      signup.click_kirim_kode_button()

      # Close Modal
      signup.click_close_button()

		  @driver.quit
	  end
  end

  describe "when user go to bukalapak main page" do
    it "search a product" do

      # Main page
      expected_main_page_title = "Situs Belanja Online dan Jual Beli Mudah Terpercaya | Bukalapak"

      # Search Page
      product = "Sang Alkemis"
      expected_hasil_pencarian_text = "Hasil pencarian"      

      @driver = Selenium::WebDriver.for :firefox
      # Go to main page
      @driver.navigate.to "https://bukalapak.com"

		  # Compare main page title
      expect(@driver.title).to eq(expected_main_page_title)

      main = MainPage.new(@driver)

      # Search product
      main.search_product(product)

      search = SearchPage.new(@driver)

      # Compare thumbnail text
      thumbnail_text = search.get_thumbnail_text()
      expect(thumbnail_text).to eq(product)

      # Compare hasil pencarian text
      hasil_pencarian_text = search.get_hasil_pencarian_text()
      expect(hasil_pencarian_text).to eq(expected_hasil_pencarian_text)

      # Compare hasil pencarian product text
      hasil_pencarian_product_text = search.get_hasil_pencarian_product_text()
      expect(hasil_pencarian_product_text).to eq('“' + product + '”')

      @driver.quit
    end
  end

end
