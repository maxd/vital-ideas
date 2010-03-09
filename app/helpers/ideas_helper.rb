module IdeasHelper

  def ideas_table
    collection_table(@ideas, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :title, t("activerecord.attributes.idea.title"), :class => "text"
      t.header.column :public, t("activerecord.attributes.idea.public"), :class => "enum"
      t.header.column :created_at, t("activerecord.attributes.idea.created_at"), :class => "date"
      t.header.column :actions, t(".actions")

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_ideas")
      t.rows.each do |row, item, index|
        row.title icon_title_cell(item), :class => "text"
        row.public t(item.public.to_s), :class => "enum"
        row.created_at I18n.l(item.created_at.localtime, :format => "%e %B %Y"), :class => "date"
        row.actions ideas_actions(item), :class => "buttons"
      end

    end
  end

  def icon_title_cell(item)
    parts = []
    parts << link_to(h(item.title), idea_path(item), :title => h(item.title))
    parts << image_tag("pin.png", :title => t(".sticked")) if item.sticky
    parts.join("\n")
  end

  def ideas_actions(item)
    edit_url = edit_idea_path(item)
    delete_url = idea_path(item)

    parts = []
    parts << link_to(image_tag("edit.png"), edit_url, :title => t("ideas.index.edit_hint"))
    parts << link_to(image_tag("delete.png"), delete_url, :method => "delete",
                     :title => t("ideas.index.delete_hint"),
                     :confirm => t("ideas.index.confirm_for_delete", :title => h(item.title)))

    parts.join("\n")
  end

#  def color_picker(name, current_color)
#    hexes = %w(black red yellow green blue)
#    current_color = hexes[0] if current_color.nil?
#    content_tag :select, :name => name, :class => "color-picker", :style => "background-color: #{current_color}",
#                :onchange => "var self = $(this); self.setStyle('background-color: ' + self.options[self.selectedIndex].value)" do
#      hexes.collect do |c|
#        options = {:value => c, :style => "background-color: #{c}"}
#        options[:selected] = "selected" if c == current_color
#        content_tag(:option, "&nbsp;", options)
#      end.join("\n")
#    end
#  end

end
