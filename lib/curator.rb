class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.detect { |artist| artist.id == id}
  end

  def find_photographs_by_artist(artist)
    @photographs.select { |photograph| photograph.artist_id == artist.id }
  end

  def photographs_by_artist
    @artists.reduce({}) do |photographs_by_artist, artist|
      photographs_by_artist[artist] = find_photographs_by_artist(artist)
      photographs_by_artist
    end
  end

  def artists_with_multiple_photographs
    photographs_by_artist.reduce([]) do |artists, artist_photo|
      artists << artist_photo.first.name if artist_photo.last.length > 1
      artists
    end
  end

  def artists_from(country)
    @artists.select { |artist| artist.country == country }
  end

  def photographs_taken_by_artist_from(country)
  end
end