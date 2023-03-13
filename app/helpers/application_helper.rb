module ApplicationHelper
    def active_class(path)
        if request.path == path
          return 'active'
        else
          return ''
        end
      end

      def logged_in?
        !!session[:user_id]
      end

      def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
      end
end
