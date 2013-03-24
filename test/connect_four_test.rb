require 'test_helper'

class ConnectFourTest < ConnectFourSpec
  def test_hello_world
    assert_equal "hello world", ConnectFour.hello_world
  end

  def test_add_player
    player = 'x'
    assert_equal player, ConnectFour.add_Player('x')
  end

  def test_playing_area
    playing_area = ConnectFour.create_playing_area
    rows = 8
    cols = 8
    assert_equal cols, playing_area.size
    x = 0
    while x < cols do
      assert_equal rows, playing_area[x].size       # check, if all columns have 8 rows
      x = x + 1
    end
  end

  def test_active_player
    active_player = ConnectFour.active_Player

    assert_equal 'x', active_player
  end

  def test_action_player
    playing_area = ConnectFour.create_playing_area
    player = ConnectFour.add_Player('x')
    player.action_player(2)                       # player(x) place a x in column 2

    assert_equal 'x', playing_area[1][0]          # 1 is the 2nd column because an array starts at 0
  end



end
