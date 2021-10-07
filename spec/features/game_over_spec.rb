feature 'end of game' do
  context 'when player 1 reaches 0 HP' do
    before do
      sign_in_and_play
      attack_and_confirm
    end

  scenario 'player 1 loses' do
    allow(Kernel).to receive(:rand).and_return(50)
    click_button "Attack"
    click_button "OK"
    click_button "Attack"
    expect(page).to have_content 'Tom loses!'
  end
end
end
