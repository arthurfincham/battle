feature 'view hit points' do
  scenario 'see player 2 hit points' do
    visit('/')
    
    fill_in "player1_name", with: "Tom"
    fill_in "player2_name", with: "Arthur"
    click_button "Submit"

    expect(page).to have_content 'Arthur: 50HP'
  end
end