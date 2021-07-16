# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
I18n.default_locale = :ru
Russian.init_i18n

# class Substance
class Substance
  attr_accessor :state

  STATES_RAND = { solid: 1, gas: 2, liquid: 3 }.freeze
  state_machine :state, initial: -> { STATES_RAND.key(rand(1..3)) } do
    event :melt do
      transition from: :solid, to: :liquid
    end
    event :freeze_ do
      transition from: :liquid, to: :solid
    end
    event :boil do
      transition from: :liquid, to: :gas
    end
    event :condense do
      transition from: :gas, to: :liquid
    end
    event :sublime do
      transition from: :solid, to: :gas
    end
    event :deposit do
      transition from: :gas, to: :solid
    end
  end
end

ACTS_RAND = { freeze_: 1, boil: 2, condense: 3, sublime: 4, deposit: 5 }.freeze
puts `clear`
substance = Substance.new
action = ACTS_RAND.key(rand(1..5))
puts I18n.t('action', action: I18n.t(action))
puts I18n.t('begin', state: I18n.t(substance.state))
if substance.method(action).call == false
  puts I18n.t('error', state: I18n.t(substance.state))
else
  puts I18n.t('end', state: I18n.t(substance.state))
end

# p substance.methods
