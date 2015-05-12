module ApplicationHelper

  def gravatar_for(chef, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest chef.email.downcase
    size = options[:size]
    url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(url, alt: chef.name, class: 'gravatar')
  end

end
