class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :subject
      t.belongs_to :student, index: true
      t.belongs_to :instructor, index: true
      t.timestamps null: false
    end
  end
end
