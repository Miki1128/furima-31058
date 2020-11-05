class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :password,format: {with: /\A[a-zA-Z0-9]+\z/}
  
  character_style  =  /\A[ぁ-んァ-ン一-龥]/
  character = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :first_name,format: { with: character_style, message: "is invalid. Input full-width characters."}
    validates :last_name,format: { with: character_style, message: "is invalid. Input full-width characters."}
    validates :first_name_kana,format: { with: character, message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana,format: { with: character, message: "is invalid. Input full-width katakana characters."}
    validates :birth_date
  end
end