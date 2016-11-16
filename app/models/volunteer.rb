class Volunteer < ApplicationRecord

  validates :email, presence: true, uniqueness: true,

            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone_number = ? ", "%#{search}%", "%#{search}%", "%#{search}%", search.to_i)
  end

  def self.vol
    where(status: true)
  end

  def self.member
    where(status: false)
  end


 end
