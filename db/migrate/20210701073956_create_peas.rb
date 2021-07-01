class CreatePeas < ActiveRecord::Migration[6.0]
  def change
    create_table :peas do |t|

      t.timestamps
    end
  end
end
