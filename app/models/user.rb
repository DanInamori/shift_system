class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: {maximum: 8}
    validates :first_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :last_name_kanji, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end

  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :shifts
  has_many :user_shift_creators
  has_many :shift_creators, through: :user_shift_creators
end
