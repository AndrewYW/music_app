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

  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  belongs_to :band,
    through :album,
    source: :band
end
