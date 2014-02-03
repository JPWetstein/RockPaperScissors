ENV['RACK_ENV'] = 'test'

require_relative '../rps_home.rb'
require_relative '../helpers/rps_helper.rb'
require 'test/unit'
require 'rack/test'

class RpsTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_throws_rock
    post '/throw', :sign => 'Rock'
    assert last_response.body.include?('Rock')
  end
  
  def test_it_throws_paper
    post '/throw', :sign => 'Paper'
    assert last_response.body.include?('Paper')
  end
  
  def test_it_throws_scissors
    post '/throw', :sign => 'Scissors'
    assert last_response.body.include?('Scissors')
  end
  
  def test_rock_should_beat_scissors
    assert shoot_result('Rock','Scissors').eql?('Win')
  end
  
  def test_rock_should_tie_rock
    assert shoot_result('Rock','Rock').eql?('Tie')
  end
  
  def test_rock_should_lose_to_paper
    assert shoot_result('Rock','Paper').eql?('Lose')
  end
  
end