module ApplicationHelper
  def is_login
  	#debugger
    if user_signed_in?
      logout_html = link_to destroy_user_session_path, method: :delete do
	    "<span class='glyphicon glyphicon-log-out'>Logout</span>".html_safe				
	  end

	  user_html = link_to edit_user_registration_path do
	  	"<span class='glyphicon glyphicon-user'>#{current_user.nickname}</span>".html_safe	
	  end

	  "<li>#{user_html}</li><li>#{logout_html}</li>".html_safe		
	else
	  signin_data = link_to new_user_session_path do
	    "<span class='glyphicon glyphicon-log-in'> Login</span>".html_safe			
	  end

	  register_data = link_to new_user_registration_path do
	    "<span class='glyphicon glyphicon-saved'> Register</span>".html_safe				
	  end 

	  "<li>#{signin_data}</li><li>#{register_data}</li>".html_safe
	end
  end
end
