class User < ActiveRecord::Base
  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
  has_many :meetups, through: :attendances
  has_many :attendances
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true, numericality: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :avatar_url, presence: true, uniqueness: true
end
