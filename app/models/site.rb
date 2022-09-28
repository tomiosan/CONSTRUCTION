class Site < ApplicationRecord
    belongs_to :admin

    validates :site_name, presence: true
    validates :site_address, presence: true
    validates :introduction, presence: false
    validates :site_status, inclusion: {in: [true, false]}
end