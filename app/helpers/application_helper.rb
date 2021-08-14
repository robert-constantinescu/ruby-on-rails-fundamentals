module ApplicationHelper

  def gravatar_for(user, options = { size: 163} )
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'rounded shadow mx-auto d-block')
  end

  def current_user
    # this is called memoization,
    #  ' ||= ' => is a common Ruby idiom: it assigns the value only if it is not already set.
    @current_user ||= User.find[session[:user_id]] if session[:user_id]
  end

  def logged_in?
    # !! => turn the variable into a boolean
    !!current_user
  end
end
