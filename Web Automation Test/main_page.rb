class MainPage

  SEARCH_FIELD = { id: 'v-omnisearch__input' }
  SEARCH_BUTTON = {css:'div#v-omnisearch > button > svg'}

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def search_product(product)
    search_field = @driver.find_element(SEARCH_FIELD)
    search_button = @driver.find_element(SEARCH_BUTTON)
    search_field.send_keys(product)
    search_button.click
    sleep(1)
  end

end
