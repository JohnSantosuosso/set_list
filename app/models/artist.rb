class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    #binding.pry
    self.songs.average(:length)
  end
end 