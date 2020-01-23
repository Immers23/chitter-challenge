require 'pg'

class Cheeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM cheeps;")
    result.map { |cheeps| cheeps['cheep'] }

    # [
    #   "some random cheep",
    #   "another test cheep",
    #   "more test cheeps"
    #  ]
  end


  def self.create(cheep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_app_test')
  else
    connection = PG.connect(dbname: 'chitter_app')
  end

  connection.exec("INSERT INTO cheeps (cheep) VALUES('#{cheep}')")
  end
end
