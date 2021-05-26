class SearchPage

  THUMBNAIL = { css: 'html > body > div:nth-of-type(2) > div > section > div > ul > li:nth-of-type(2) > a > span' }
  HASIL_PENCARIAN_TEXT = {css:'html > body > div:nth-of-type(2) > div > section > div > div > p'}
  HASIL_PENCARIAN_PRODUCT_TEXT = {css:'html > body > div:nth-of-type(2) > div > section > div > div > h1 > b'}

  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end

  def get_thumbnail_text()
    thumbnail_text = @driver.find_element(THUMBNAIL)
    thumbnail_text.text
  end

  def get_hasil_pencarian_text()
    hasil_pencarian_text = @driver.find_element(HASIL_PENCARIAN_TEXT)
    hasil_pencarian_text.text
  end

  def get_hasil_pencarian_product_text()
    hasil_pencarian_product_text = @driver.find_element(HASIL_PENCARIAN_PRODUCT_TEXT)
    hasil_pencarian_product_text.text
  end

end
