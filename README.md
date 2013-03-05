# Cucumber Salad

Cucumber Salad is a gem for use at the BBC for testing our applications with cucumber.

##Device Support

Cucumber Salad makes it easy to test using multiple devices using the same steps.

For example:

```gherkin_en
Feature: Using a device
  Given I am using a smartphone
```

You would then use the use_device method for selecting a pre defined driver:

```ruby
Then /^I am using a smartphone$/ do
  use_device(:smartphone)
end
```

This then allows you to override the device driver using the command line

```
smartphone=iphone bundle exec cucumber
```

If the driver you are trying to use is not defined then you will be given instructions on how to create one.

The predefined drivers are as follows:

* Desktop - firefox - Selenium Webdriver
* Tablet - ipad - Poltergiest
* Smartphone - iphone - Poltergiest
* Feature Phone - blackberry - Poltergiest

## Cookie API

The cookie API manages the cookie jars for the different drivers under a common API.

To add a cookie:

```ruby
Helper::Cookie.add('cookie-key', 'cookie-value', :domain => 'bbc.co.uk')
```

Optional paramters can be passed to the add method, currently this is only the domain option.

Support for test cookies are also included which are used by the Pal Library Sport.

```ruby
Helper::Cookie.add_test_cookie('test-cookie-key', 'text-cookie-value')
```

## Flagpoles

Flagpoles are also supported for use in conjuction with Pal Library Sport.

```ruby
Helper::Flagpoles.set('flagpole-name', 'ON')
```

## Stubs

Methods can be stubbed using the stub api. Depending on your environment the stubs will either be written to the local file system or to our redis store.

In your cucumber env you will need to set the path where your application will look for stubs:

```ruby
Helper::Stub.create_key('class_name', 'method_name')
Helper::Stub.register(:content => {
    :response => {
      :some => 'json data'
    }
  }
)
```