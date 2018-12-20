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
  validates :band, :title, :year, presence: true
  validates :live, inclusion: {in: [true, false]}
  validates :name, uniqueness: { scope: :band_id}
  validates :year, numericality: {minimum: 1900, maximum: 9000}


  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    dependent: :destroy
end
