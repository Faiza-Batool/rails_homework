class User < ApplicationRecord
    
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :first_name, :last_name, presence:true

    validates :email, presence:true, uniqueness:true ,format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }

    validates :password, presence: true, length: { minimum: 3 }, :on => :create

    def full_name
        "#{first_name} #{last_name}"
    end
end
