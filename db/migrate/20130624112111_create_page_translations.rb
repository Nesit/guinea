# Encoding: utf-8
class CreatePageTranslations < ActiveRecord::Migration
  def up
    remove_column :pages, :content
    remove_column :pages, :name
    Page.create_translation_table!(
      {content: :text, name: :text},
      {:migrate_data => true}
    )
  end

  def down
    add_column :pages, :content, :text
    add_column :pages, :name, :string
    Page.drop_translation_table!
  end
end
