class CreateQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :quotations do |t|
      t.string :author_name
      t.text :category
      t.text :newcategory
      t.text :quotation

      t.timestamps
    end
  end
end
