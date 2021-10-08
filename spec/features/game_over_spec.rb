feature 'Game Over' do    
  scenario 'player 1 loses' do
    sign_in_and_play
    4.times { attack_and_confirm("right-hook")
              attack_and_confirm("head-kick")
    }
    choose("right-hook", allow_label_click: true)
    click_button "attack"
    expect(page).to have_content 'Tom loses!'
  end
end
