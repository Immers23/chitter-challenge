require 'pg'

feature 'Viewing cheeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Cheep test"
  end
end


feature 'Viewing cheeps' do
  scenario 'A user can see cheeps' do
    # connection = PG.connect(dbname: 'chitter_app_test')
    #
    #
    # connection.exec("INSERT INTO cheeps VALUES(1, 'testing with a random cheep of giberish');")
    # connection.exec("INSERT INTO cheeps VALUES(2, 'a cheep about a tv programme');")
    # connection.exec("INSERT INTO cheeps VALUES(3, 'a new complaining cheep');")

    Cheeps.create(cheep: 'testing with a random cheep of giberish')
    Cheeps.create(cheep: 'a cheep about a tv programme')
    Cheeps.create(cheep: 'a new complaining cheep')

    visit('/cheeps')

    expect(page).to have_content 'testing with a random cheep of giberish'
    expect(page).to have_content 'a cheep about a tv programme'
    expect(page).to have_content 'a new complaining cheep'
  end
end
