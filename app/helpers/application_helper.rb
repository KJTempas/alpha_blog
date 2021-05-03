module ApplicationHelper
                #set default size as 80
    def gravatar_for(user, options = { size: 80 })
        email_address = user.email.downcase 
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

    def current_user #retrieve current user instance var or look up in dbase
        @current_user ||= User.find(session[:user_id]) if session[:user_id]  #access current user by id
    end

    def logged_in?
        !!current_user  # !! makes current_user a boolean
    end

end
