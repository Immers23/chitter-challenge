require 'pg'

p "Setting up test database..."

def setup_test_database
connection = PG.connect(dbname: 'chitter_app_test')

# Clear the bookmarks table
connection.exec("TRUNCATE cheeps;")
end
