module ApplicationHelper
  def gravatar_for(email)
    hashed_email = Disgest::MD5.hexdigest(email.downcast.strip)
    image_tag "http://www.gravatar.com/avatar/#{hashed_email}?s=50.jpg", alt: 'Profile Photo'
  end
end
