class Comment < ApplicationRecord
    validates :body, :user_id, :link_id, presence: true
    
    belongs_to :user
    belongs_to :link
end
