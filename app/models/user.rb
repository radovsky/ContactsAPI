# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :name, :email, presence: true, uniqueness: true
  
  has_many(
    :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Contact"
  )
  
  has_many :contact_shares
  
  has_many(
    :authored_comments,
    class_name: "Comment",
    primary_key: :id,
    foreign_key: :author_id
  )
  
  has_many(
    :comments, 
    as: :commentable,
    class_name: 'Comment',
    primary_key: :id,
    foreign_key: :commentable_id
    )
end
