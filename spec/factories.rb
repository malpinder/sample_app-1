FactoryGirl.define do
	factory :user do
		name					"Austin Chang"
		email					"austin@example.com"
		password 				"foobar"
		password_confirmation 	"foobar"
	end
end
