class Favorite < ApplicationRecord
	belongs_to :user
    belongs_to :post

    # 1User1いいねにする
    validates_uniqueness_of :post_id, scope: :user_id
end
