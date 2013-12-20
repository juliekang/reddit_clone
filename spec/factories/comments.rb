# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    parent_comment_id 1
    link_id 1
    user_id 1
    body "MyString"
  end
end
