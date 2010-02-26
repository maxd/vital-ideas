class Settings::Application < ApplicationController

  access_control do
    default :deny

    allow logged_in
  end

end
