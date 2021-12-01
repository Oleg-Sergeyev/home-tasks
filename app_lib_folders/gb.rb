# frozen_string_literal: true

# Gb
class Gb
  def self.count(page)
    Faraday.post(page).body.split("\n").size
  end
end
