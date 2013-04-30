Capybara.register_driver :phantomjs do |app|
  driver = Capybara::Poltergeist::Driver.new(app, 
    phantomjs_options: %w(--load-images=no --local-storage-quota=0 --proxy-type=none),
    inspector: true,
    js_errors: true,
    extensions: Helper::Driver.phantomjs_extensions
  )
  Helper::Driver.register(
    :smartphone,
    :poltergeist,
    "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B141 Safari/8536.25"
  )
  driver
end