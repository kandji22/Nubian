class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.string :name
      t.string :lieu
      t.date :date

      t.timestamps
    end
  end
end
