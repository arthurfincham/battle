feature 'Attacking' do
  scenario 'Player 1 can attack player 2 and gets confirmation' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content 'Arthur was attacked by Tom!'
  end
end