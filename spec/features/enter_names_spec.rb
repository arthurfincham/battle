feature 'Testing infrastructure' do
  scenario 'Can enter names, submit names, and see them on screen' do
    visit('/')
    
    fill_in "player1_name", with: "Tom"
    fill_in "player2_name", with: "Arthur"
    click_button "Submit"

    expect(page).to have_content 'Welcome Tom & Arthur!'
  end
end