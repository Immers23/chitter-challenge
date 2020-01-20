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
end
