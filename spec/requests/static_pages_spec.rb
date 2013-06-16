
require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
=begin 
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "should have the base title" do
    	visit '/static_pages/home'
    	expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
    	visit '/static_pages/home'
    	expect(page).not_to have_title('| Home')
    end
  end
describe "Help page" do

	it "should have content 'Help'" do
		visit '/static_pages/help'
		expect(page).to have_content('Help')
	end
	it "should have title 'Help'" do
		visit '/static_pages/help'
		expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
	end
end
describe "About page" do
	it "should have the content 'About Us'" do
		visit '/static_pages/about'
		expect(page).to have_content('About Us')
	end
	it "should have title 'About'" do
		visit '/static_pages/about'
		expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
	end
end
describe "Contact page" do
	it "should have content 'Contact Us'" do
		visit 'contact_path'
		expect(page).to have_content('Contact Us')
	end
	it "should have title 'Contact Us'" do
		visit 'contact_path'
		expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact Us")
	end
end
=end


	describe "for signed-in users" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
			FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet") 
			sign_in user
			visit root_path
		end

		it "should render the user's feed" do
			user.feed.each do |item|
				expect(page).to have_selector("li##{item.id}", text: item.content)
			end
		end

		describe "follower/following counts" do
			let(:other_user) { FactoryGirl.create(:user) } 
			before do
				other_user.follow!(user)
				visit root_path
			end

			#it { should have_link('0 following', href: following_user_path(user)) }
			#it { should have_link("1 followers", href: followers_user_path(user)) }
		end

	end



end
end
