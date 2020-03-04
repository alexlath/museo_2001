require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/curator'
require './lib/loadable'

class LoadableTest < Minitest::Test
  def setup
    @path = './data/photographs.csv'
    @curator = Curator.new
  end

  def test_it_can_load_CSV_data
    assert_equal Array, @curator.csv_data(@path, Photograph).class
    assert_equal 4, @curator.csv_data(@path, Photograph).length
    assert_instance_of Photograph, @curator.csv_data(@path, Photograph).first
  end
end