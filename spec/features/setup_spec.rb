feature 'Entering Players' do
  scenario 'Can enter names, submit names, and see them on screen' do
    sign_in_and_play
    expect(page).to have_content 'Tom vs. Arthur'
  end
end