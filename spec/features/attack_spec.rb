feature 'Attack' do

  before do
    sign_in_and_play
    click_button "Attack"
  end
  
  scenario 'Player 1 can attack player 2 and gets confirmation' do
    expect(page).to have_content 'Arthur was attacked by Tom!'
  end

  scenario 'Player 2 loses 2 HP' do
    expect(page).not_to have_content 'Arthur: 50HP'
    expect(page).to have_content 'Arthur: 40HP'
  end
end