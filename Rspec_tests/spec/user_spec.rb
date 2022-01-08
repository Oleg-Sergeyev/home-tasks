require './lib/user'
require 'faker'

RSpec.describe 'Пользователь' do
  context 'корректность работы метода SET' do
    let(:data) do
      surnames = []
      names = []
      patronymics = []
      emails = []
      10.times do
        surnames.push(Faker::Name.last_name)
        names.push(Faker::Name.first_name)
        patronymics.push(Faker::Name.middle_name)
        emails.push(Faker::Internet.email)
      end
      [surnames, names, patronymics, emails]
    end

    let(:object) do
      User.new(data[0].sample,data[1].sample, data[2].sample, data[3].sample)
    end

    it 'должен содержать Фамилию ' do
      p object
      expect(data[0].include?(object.surname)).to be true
    end

    it 'должен содержать Имя ' do
      expect(data[1].include?(object.name)).to be true
    end

    it 'должен содержать Отчество ' do
      expect(data[2].include?(object.patronymic)).to be true
    end

    it 'должен содержать Эл.почту ' do
      expect(data[3].include?(object.email)).to be true
    end
  end
end
