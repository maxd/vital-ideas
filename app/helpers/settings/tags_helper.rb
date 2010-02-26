module Settings::TagsHelper

  def tag_table
    collection_table(@tags, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :name, t("activerecord.attributes.tag.name"), :class => "text"
      t.header.column :actions, t(".actions")

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_tags")
      t.rows.each do |row, item, index|
        row.name render_tag(item), :class => "text"
        row.actions tags_actions(item), :class => "buttons"
      end
    end
  end

  def tags_actions(item)
    edit_url = edit_settings_tag_path(item)
    delete_url = settings_tag_path(item)

    parts = []
    parts << link_to(image_tag("edit.png"), edit_url, :title => t(".edit_hint"))
    parts << "&nbsp;"
    parts << link_to(image_tag("delete.png"), delete_url, :method => "delete",
                     :title => t(".delete_hint"),
                     :confirm => t(".confirm_for_delete", :name => item.name))

    parts.join("\n")
  end

  def tag_color_picker(form)
    content_tag :div, :class => "tag-color-picker clearfix" do
      parts = []
      parts << form.hidden_field(:foreground_color)
      parts << form.hidden_field(:background_color)
      parts << TAG_COLORS.collect do |tag_color|
        css_class = [ "tag-color" ]
        css_class << "active-tag-color" if tag_color[:foreground_color] == form.object.foreground_color and tag_color[:background_color] == form.object.background_color
        content_tag :div, "t", :class => css_class.join(" "), :style => "color: #{tag_color[:foreground_color]}; background-color: #{tag_color[:background_color]}"
      end.join("")
      parts.join("")
    end
  end

end
