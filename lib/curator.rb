require 'csv'
require './lib/photograph'
require './lib/artist'

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

  def artist_ids_from(country)
    @artists.reduce([]) do |artist_ids, artist|
      artist_ids << artist.id if artist.country == country
      artist_ids
    end
  end

  def photographs_taken_by_artist_from(country)
    @photographs.select do |photograph|
      artist_ids_from(country).include?(photograph.artist_id)
    end
  end

  def csv_data(path, object)
    csv = CSV.open(path, headers: :first_row, header_converters: :symbol)
    csv.map { |row| object.new(row) }
  end

  def load_photographs(path)
    csv_data(path, Photograph).each do |photograph|
      add_photograph(photograph)
    end
  end
end