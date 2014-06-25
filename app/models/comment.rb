# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  author_id        :integer          not null
#  body             :text             not null
#  contact_id       :integer
#  user_id          :integer
#  contact_share_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  belongs_to(
    :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id
  )
  
  belongs_to :commentable, polymorphic: true, primary_key: :id, foreign_key: :commentable_id
end
