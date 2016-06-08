class Post
  include Mongoid::Document
  field :title, type: String
  field :description, type: String

  # validates :title, :description, presence: true

  belongs_to :user
end
