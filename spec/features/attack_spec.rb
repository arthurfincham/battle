feature 'Attack' do

  context 'damage is random' do
    before do
      sign_in_and_play
    end

    scenario 'Player 1 can attack player 2 and gets confirmation' do
      click_button "Attack"
      expect(page).to have_content 'Tom attacked Arthur'
    end
  end

  context 'damage is at 10' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
    end
    
    scenario 'reduce player 2 HP by 10' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content 'Arthur: 50HP'
      expect(page).to have_content 'Arthur: 40HP'
    end
    
    scenario 'be attacked by Player 2' do
      sign_in_and_play
      attack_and_confirm
      click_button "Attack"
      expect(page).to have_content 'Arthur attacked Tom'
    end
    
    scenario 'reduce player 1 HP by 10' do
      sign_in_and_play
      2.times{ attack_and_confirm }
      expect(page).not_to have_content 'Tom: 50HP'
      expect(page).to have_content 'Tom: 40HP'
    end
  end
end