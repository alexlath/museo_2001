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
  #   @artists.reduce({}) do |photographs_by_artist, artist|
  #     photographs_by_artist[artist] = @photographs.select
  end
end