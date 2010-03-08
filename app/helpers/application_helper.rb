module ApplicationHelper

  def render_tag(tag, link = false)
    content_tag :span, h(tag.name), :class => "tag", :style => "color: #{tag.foreground_color}; background-color: #{tag.background_color}" do
      if link
        link_to h(tag.name), tagged_ideas_path(tag.name)
      else
        h(tag.name)
      end
    end
  end

  def render_tags(tags, link = false)
    content_tag :span, :class => "tags-line" do
      tags.collect { |tag| render_tag(tag, link) }.join("")
    end
  end

end
