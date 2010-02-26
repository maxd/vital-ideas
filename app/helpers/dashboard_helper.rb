module DashboardHelper

  def sticked_ideas_table
    collection_table(@sticked_ideas, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :title, t("activerecord.attributes.idea.title"), :class => "text"
      t.header.column :updated_at, t("activerecord.attributes.idea.updated_at"), :class => "date"

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_ideas")
      t.rows.each do |row, item, index|
        row.title link_to(item.title, idea_path(item), :title => item.title)
        row.updated_at I18n.l(item.updated_at.localtime, :format => "%e %B %Y"), :class => "date"
      end

    end
  end

  def published_ideas_table
    collection_table(@published_ideas, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :title, t("activerecord.attributes.idea.title"), :class => "text"
      t.header.column :updated_at, t("activerecord.attributes.idea.updated_at"), :class => "date"

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_ideas")
      t.rows.each do |row, item, index|
        row.title link_to(item.title, idea_path(item), :title => item.title)
        row.updated_at I18n.l(item.updated_at.localtime, :format => "%e %B %Y"), :class => "date"
      end

    end
  end

  def last_ideas_table
    collection_table(@last_ideas, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :title, t("activerecord.attributes.idea.title"), :class => "text"
      t.header.column :created_at, t("activerecord.attributes.idea.created_at"), :class => "date"

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_ideas")
      t.rows.each do |row, item, index|
        row.title link_to(item.title, idea_path(item), :title => item.title)
        row.created_at I18n.l(item.created_at.localtime, :format => "%e %B %Y"), :class => "date"
      end

    end
  end

  def last_changed_ideas_table
    collection_table(@last_changed_ideas, :class => 'app-table') do |t|
      t.header.hide_when_empty = false
      t.header.column :title, t("activerecord.attributes.idea.title"), :class => "text"
      t.header.column :updated_at, t("activerecord.attributes.idea.updated_at"), :class => "date"

      t.rows.alternate = :odd
      t.rows.empty_caption = t(".no_ideas")
      t.rows.each do |row, item, index|
        row.title link_to(item.title, idea_path(item), :title => item.title)
        row.updated_at I18n.l(item.updated_at.localtime, :format => "%e %B %Y"), :class => "date"
      end

    end
  end

end
