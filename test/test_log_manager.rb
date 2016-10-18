require 'minitest/autorun'
require 'log_manager'

class LogManagerTest < Minitest::Test

  def test_project_name_type
    assert LogManager.project_name.is_a? String
    assert (LogManager.project_name.split.size == 1)
  end

  def test_hi
    assert_equal "Hi #{LogManager.project_name}, If you are looking for a gem that helps you manage your log and also make your day awesome, You just found it!", LogManager.hi
  end

end