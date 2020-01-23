require 'cheeps'

describe Cheeps do
  describe '.all' do
    it 'returns all cheeps' do
      connection = PG.connect(dbname: 'chitter_app_test')

      # connection.exec("INSERT INTO cheeps (cheep) VALUES('testing with a random cheep of giberish');")
      # connection.exec("INSERT INTO cheeps (cheep) VALUES('a cheep about a tv programme');")
      # connection.exec("INSERT INTO cheeps (cheep) VALUES('a new complaining cheep');")

      connection.exec("INSERT INTO cheeps VALUES(1, 'testing with a random cheep of giberish');")
      connection.exec("INSERT INTO cheeps VALUES(2, 'a cheep about a tv programme');")
      connection.exec("INSERT INTO cheeps VALUES(3, 'a new complaining cheep');")

      cheeps = Cheeps.all

      expect(cheeps).to include('testing with a random cheep of giberish')
      expect(cheeps).to include('a cheep about a tv programme')
      expect(cheeps).to include('a new complaining cheep')
    end
  end
end

describe '.create' do
  it 'creates a new cheep' do
    Cheeps.create(cheep: 'oooh look im going to cheep about my opinion')

    expect(Cheeps.all).to include 'oooh look im going to cheep about my opinion'
  end
end
