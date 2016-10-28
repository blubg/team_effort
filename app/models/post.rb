class Post < ApplicationRecord

has_many :comments, -> {order(created_at: :desc)}, dependent: :destroy
belongs_to :user
validates :title, presence: true, uniqueness: {case_sensitive: false, message: 'must be unique'}
validates :body, length: { minimum: 5 }

has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "200x200#"}

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

def self.search(search)
  where("title ILIKE ? OR body ILIKE ?","%#{search}%","%#{search}%")
end
end
