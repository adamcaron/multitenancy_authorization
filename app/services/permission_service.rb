class PermissionService
  attr_reader :user
  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    if user.registered_user?
      return true if controller == 'stores' && action.in?(%w(index show))
      return true if controller == 'sessions' && action.in?(%w(new create destroy))
    else
      return true if controller == 'stores' && action == 'index'
      return true if controller == 'sessions' && action.in?(%(new create destroy))
    end
  end
end
