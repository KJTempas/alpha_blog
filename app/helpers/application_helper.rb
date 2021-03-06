module ApplicationHelper
                #set default size as 80
    def gravatar_for(user, options = { size: 80 })
        email_address = user.email.downcase 
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

#info from http://geekhmer.github.io/blog/2016/02/10/rails-flash-messages-styles/
    def bootstrap_class_for(flash_type)
        case flash_type
            when "alert"
                "alert-danger"
            when "notice"
                "alert-success"
            else  
                flash_type.to_s    
            end
        end


end
