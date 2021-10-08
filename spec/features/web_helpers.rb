def sign_in_and_play
  visit('/')
  fill_in "player1", with: "Tom"
  fill_in "player2", with: "Arthur"
  click_button "enter"
end

def attack_and_confirm(technique)
  choose(technique, allow_label_click: true)
  click_button "attack"
  click_button "OK"
end