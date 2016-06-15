class CreateTestObjects < ActiveRecord::Migration
  def change
    create_table :test_objects do |t|
      t.string :value

      t.timestamps null: false
    end
    TestObject.find_or_create_by(value: 1)
    TestObject.find_or_create_by(value: 2)
    TestObject.find_or_create_by(value: 3)
  end
end
