class Comment < ApplicationRecord
  
  #ASSOCIATIONS
  belongs_to :post
  belongs_to :user

  #VALIDATIONS
  validates :body, presence: {message: "must be provided"}

end
