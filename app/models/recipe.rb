class Recipe < ActiveRecord::Base

  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 150 }
  validates :description, presence: true, length: { minimum: 20, maximum: 500 }
  validates :chef_id, presence: true
  validate :picture_size

  mount_uploader :picture, PictureUploader

  belongs_to :chef
  has_many :likes

  def liked
    Like.liked(self).count
  end

  def disliked
    Like.disliked(self).count
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, 'should be less than 5 MB'
    end
  end

end
