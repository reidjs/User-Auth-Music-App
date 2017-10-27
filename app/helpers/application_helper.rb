module ApplicationHelper
  def user_status(user)
    "Logged in as: #{user.email}"
  end
end
