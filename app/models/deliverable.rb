class Deliverable < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :file
  belongs_to :user

  validates :file, {
    presence: true
  }
  
  def get_file_url
    url_for(self.file)
  end
  
end
