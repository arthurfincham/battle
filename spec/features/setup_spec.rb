feature 'Entering Players' do
  scenario 'Can enter names, submit names, and see them on screen' do
    sign_in_and_play
    expect(page).to have_text('Arthur 50 HP', normalize_ws: true)
    expect(page).to have_text('Tom 50 HP', normalize_ws: true)
  end
end