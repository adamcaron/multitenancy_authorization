class PermissionService
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    return true if controller == 'stores' && action == 'index'
  end
end
