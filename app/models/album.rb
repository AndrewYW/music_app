# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  live       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer          not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  
end
