feature 'Attack' do

  context 'damage is random' do
    before do
      sign_in_and_play
    end

    scenario 'Player 1 can attack player 2 and gets confirmation' do
      choose('right-hook', allow_label_click: true)
      click_button "attack"
      expect(page).to have_content 'Tom attacked Arthur'
    end
  end

  context 'taking damage' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
    end
    
    scenario 'reduce player 2 HP by 10' do
      sign_in_and_play
      attack_and_confirm("upper-cut")
      expect(page).not_to have_content 'Arthur\n50 HP'
      expect(page).to have_text('Arthur 40 HP', normalize_ws: true)
    end
    
    scenario 'be attacked by Player 2' do
      sign_in_and_play
      attack_and_confirm("head-kick")
      choose('right-hook', allow_label_click: true)
      click_button "attack"
      expect(page).to have_content 'Arthur attacked Tom'
    end
    
    scenario 'reduce player 1 HP by 10' do
      sign_in_and_play
      2.times{ attack_and_confirm("body-kick") }
      expect(page).not_to have_content '50 HP\nTom'
      expect(page).to have_text('Tom 42 HP', normalize_ws: true)
    end
  end
end