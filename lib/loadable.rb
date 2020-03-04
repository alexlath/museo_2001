require 'csv'
require './lib/photograph'
require './lib/artist'

module Loadable
  def csv_data(file_path, object)
    csv = CSV.open(file_path, headers: :first_row, header_converters: :symbol)
    csv.map { |row| object.new(row) }
  end
end