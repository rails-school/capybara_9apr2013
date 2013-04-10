require 'spec_helper'

feature 'Posts' do
  scenario 'User visits new post page' do
    visit 'localhost:8998/'
    click_link 'Create a post'

    expect(page).to have_content 'New post'
    expect(current_path).to eq '/posts/new'
  end

  scenario 'User creates a post' do
    user_visits_new_post_page
    fill_in 'Title', with: 'My test post'
    fill_in 'Body', with: 'Test description'
    click_button 'Create'

    expect(current_path).to match %r{/posts/\d}
    expect(page).to have_content 'My test post'
    expect(page).to have_content 'Test description'
  end

  scenario 'User creates a post without title' do
    visit_new_post_page
    fill_in 'Body', with: 'Test description'
    click_button 'Create'

    expect(current_path).to eq '/posts/new'
    expect(page).to have_css '.error', text: 'Title cannot be blank'
  end

  def visit_new_post_page
    visit '/posts/new'
  end
end
