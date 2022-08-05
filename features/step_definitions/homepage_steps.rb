When('I go to Home page') do
  url = "/"
  visit url
end

Then('I can see {string} brand name') do |brand|
  expect(page).to have_selector('#page_title', text: brand)
end