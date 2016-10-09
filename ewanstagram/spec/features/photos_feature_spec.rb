require 'rails_helper'

feature 'photos' do
  context 'no photos uploaded' do
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet!'
      expect(page).to have_link 'Add a photo'
    end
  end

    context 'photos have been added' do
    before do
      Photo.create(caption: 'first photo')
    end

    scenario 'display restaurants' do
      visit '/photos'
      expect(page).to have_content('first photo')
      expect(page).not_to have_content('No photos yet!')
    end
  end

  context 'posting photos' do
    scenario 'prompts a user to fill out form for caption and then displays photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'photo_caption', with: 'second photo'
      click_button 'Post photo'
      expect(page).to have_content 'second photo'
      expect(current_path).to eq '/'
    end
  end
end
