SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = "app-active-item"
  navigation.items do |primary|

    primary.item :new_idea, t(".new_idea"), new_idea_path
    primary.item :edit_idea, t(".edit_idea"), edit_idea_path(params[:id] || 0), :if => lambda { [ :show ].include?(action_name.to_sym) }
#    primary.item :delete_idea, t(".delete_idea"), idea_path(params[:id] || 0), :method => :delete, :if => lambda { [ :show, :edit, :update ].include?(action_name.to_sym) }
  end
end