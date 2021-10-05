def sign_in_and_play
  visit('/')
  fill_in "player1_name", with: "Tom"
  fill_in "player2_name", with: "Arthur"
  click_button "Submit"
end