# frozen_string_literal: true

module RoleHelper
  def onlyadmincanedit?
    if session[:user_id].present?
      current_user.role == 'admin'
    else
      false
   end
  end

  def can_edit?(user)
    case current_user.role
    when 'admin' then true
    when 'registered' then current_user == user
    else false

end
end
end
