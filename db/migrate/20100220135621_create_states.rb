class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :title, :null => false
      t.text :description

      t.timestamps
    end

    State.create! :title => I18n.t("state.just_an_idea")
    State.create! :title => I18n.t("state.detailed_idea")
    State.create! :title => I18n.t("state.prototype")
    State.create! :title => I18n.t("state.completed_product")
    State.create! :title => I18n.t("state.empty_idea")
    State.create! :title => I18n.t("state.hard_for_realization")
    State.create! :title => I18n.t("state.abortive_idea")
  end

  def self.down
    drop_table :states
  end
end
