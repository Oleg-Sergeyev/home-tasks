# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require(:development)

map '/images' do
  run Rack::File.new 'images'
end

# class App
class App
  attr_accessor :title, :description

  def initialize(title:, description:)
    @title = title
    @description = description
  end

  def call(env)
    case env['PATH_INFO']
    when '/'
      [200, { 'Content-Type' => 'text/html' }, [format(HTML, title, title, description)]]
    else
      [404, { 'Content-Type' => 'text/html' }, [format(HTML_NF, title, title, description)]]
    end
  end

  HTML = <<~HTML
    <!DOCTYPE html>
    <html>
      <head>
        <title>%s</title>
        <meta charset='utf-8' />
      </head>
      <body>
        <h1>%s</h1>
        <p>
          <img
            width='100' height='100' src='/images/ruby.jpeg'
            style='float: left; padding: 0 10px 0 0' />
          %s
        </p>
      </body>
    </html>
  HTML

  HTML_NF = <<~HTML
    <!DOCTYPE html>
    <html>
      <head>
        <title>%s</title>
        <meta charset='utf-8' />
      </head>
      <body>
         <h1>Page not found</h1>
      </body>
    </html>
  HTML
end

run App.new(
  title: 'Язык программирования Ruby',
  description: 'Ruby (англ. ruby — рубин, произносится — динамический, рефлективный, интерпретируемый высокоуровневый язык программирования[7][8]. Язык обладает независимой от операционной системы реализацией многопоточности, сильной динамической типизацией, сборщиком мусора и многими другими возможностями[⇨]. По особенностям синтаксиса он близок к языкам Perl и Eiffel, по объектно-ориентированному подходу — к Smalltalk. Также некоторые черты языка взяты из Python, Lisp, Dylan и Клу.'
)
