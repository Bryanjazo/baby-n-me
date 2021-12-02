class CreateApiV1Channels < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_channels do |t|

      t.timestamps
    end
  end
end
