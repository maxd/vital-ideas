# Configures dashboard sidebar menu

SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = "app-active-item"
  navigation.items do |primary|

    primary.item :new_idea, t(".new_idea"), new_idea_path

  end
end