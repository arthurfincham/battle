feature 'Hit Points' do
  scenario 'see player 2 hit points' do
    sign_in_and_play
    expect(page).to have_text('Arthur 50 HP', normalize_ws: true)
  end

  scenario 'see my own hit points' do
    sign_in_and_play
    expect(page).to have_text('Tom 50 HP', normalize_ws: true)
  end
end 