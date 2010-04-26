class Notifier < ActionMailer::Base

  add_template_helper(ApplicationHelper)

  def password_reset_instructions(user)
    subject       I18n.t("title_of_reset_password_email")
    from          "Don't reply <#{FROM_EMAIL_ADDRESS}>"
    headers       ({ "return-path" => FROM_EMAIL_ADDRESS })
    recipients    user.email
    content_type  "text/html"
    body          :reset_password_url => reset_password_url(user.perishable_token)
  end

  def weekly_report(user, ideas_on_this_week, user_name)
    subject       I18n.t("weekly_report")
    from          "Notification <#{FROM_EMAIL_ADDRESS}>"
    headers       ({ "return-path" => FROM_EMAIL_ADDRESS })
    recipients    user.email
    content_type  "text/html"
    body          :ideas_on_this_week => ideas_on_this_week, :user_name => user_name
  end

end
