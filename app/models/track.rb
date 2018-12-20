# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  lyrics     :text
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer          not null
#

class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true
  validates :ord, uniqueness: {scope:  :album_id}
  validates :bonus, inclusion: {in: [true, false]}

  
  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  has_one :band,
    through: :album,
    source: :band
end
