class Post < ApplicationRecord
    
    #ASSOCIATIONS
    has_many :comments, dependent: :destroy 
    belongs_to :user

    #VALIDATIONS
    validates :title, presence: {message: "must be provided"}, uniqueness: true
    validates :body, presence: true, length: {minimum: 50}

end
