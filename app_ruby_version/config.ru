# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require(:development)

# class App
class App
  class << self
    def call(env)
      headers = { 'Content-Type' => 'text/html' }
      code = 200
      name = 'RUBY verison is:'
      case env['PATH_INFO']
      when '/'
        body = ''
      when '/X-Ruby-Version'
        body = RUBY_VERSION
      else
        code = 404
        name = 'Page '
        body = 'Not Found'
      end
      [code, headers, [main_page(name, body)]]
    end

    def main_page(name, body)
      <<~HTML
        <!DOCTYPE html>
        <html lang="ru">
          <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
            <title>RUBY</title>
          </head>
          <body>
            <div class="content" id="message_block">
              <a href="/X-Ruby-Version">#{name} #{body}</a>
             </div>
          </body>
        </html>
      HTML
    end
  end
end

run App
