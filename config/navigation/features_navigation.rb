SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = "app-active-item"
  navigation.items do |primary|

    primary.item :new_feature, t(".new_feature"), new_idea_feature_path(@idea)
#    primary.item :edit_feature, t(".edit_feature"), edit_idea_feature_path(@idea, params[:id] || 0), :if => lambda { [ :show ].include?(action_name.to_sym) }
  end
end