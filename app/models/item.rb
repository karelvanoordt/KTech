class Item < ApplicationRecord
    mount_uploader :image, ImageUploader
    serialize :image, JSON # In case of SQLite
    belongs_to :user, optional: true

    validates :item_name, :price, :condition, :description, presence: true
    validates :description, length: { maximum: 1000, too_long: 'Description shoud be 1000 characters max' }
    validates :item_name, length: { maximum: 140, too_long: 'Item name should be 140 characters max' }
    validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

    CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
