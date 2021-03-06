class MigrateTranslationDataFromPtToPtBr < ActiveRecord::Migration
  def up
    execute "UPDATE gateways SET title_translations = title_translations || hstore('pt-BR', (title_translations -> 'pt'))"
    execute "UPDATE gateways SET ordering_translations = ordering_translations || hstore('pt-BR', (ordering_translations -> 'pt'))"
    execute "UPDATE initiatives SET name_translations = name_translations || hstore('pt-BR', (name_translations -> 'pt'))"
    execute "UPDATE initiatives SET first_text_translations = first_text_translations || hstore('pt-BR', (first_text_translations -> 'pt'))"
    execute "UPDATE initiatives SET second_text_translations = second_text_translations || hstore('pt-BR', (second_text_translations -> 'pt'))"
  end
  def down
    execute "UPDATE gateways SET title_translations = delete(title_translations, 'pt-BR')"
    execute "UPDATE gateways SET ordering_translations = delete(ordering_translations, 'pt-BR')"
    execute "UPDATE initiatives SET name_translations = delete(name_translations, 'pt-BR')"
    execute "UPDATE initiatives SET first_text_translations = delete(first_text_translations, 'pt-BR')"
    execute "UPDATE initiatives SET second_text_translations = delete(second_text_translations, 'pt-BR')"
  end
end
