feature 'end of game' do    
  scenario 'player 1 loses' do
    sign_in_and_play
    attack_and_confirm
    allow(Kernel).to receive(:rand).and_return(50)
    attack_and_confirm
    click_button "Attack"
    expect(page).to have_content 'Tom loses!'
  end
end
