class Book < ApplicationRecord


   belongs_to :user


   validates :title, presence: true
   validates :body, presence: true
   has_one_attached :profile_image

   validates :body,
     length: { minimum: 1, maximum: 200 }

   def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image
   end

end
