feature 'view hit points' do
  scenario 'see player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Arthur: 50HP'
  end

  scenario 'see my own hit points' do
    sign_in_and_play
    expect(page).to have_content '50HP: Tom'
  end
end 