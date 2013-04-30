Capybara.register_driver :safari do |app|
  driver = Capybara::Selenium::Driver.new(app,
    browser: :safari
  )
  Helper::Driver.register(
    :smartphone,
    :selenium
  )
  driver
end