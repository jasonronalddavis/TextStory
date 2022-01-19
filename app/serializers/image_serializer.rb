class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :comments, :categories, :story_texts, :url

  has_many :user_images
  has_many :users, through: :user_images
  has_many :image_categories
  has_many :categories, through: :image_categories
  has_many :story_text_images
  has_many :story_texts, through: :story_text_images 
  has_many :image_comments
  has_many :comments, through: :image_comments 

end
