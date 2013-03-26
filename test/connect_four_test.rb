require 'test_helper'

class ConnectFourTest < ConnectFourSpec
  def test_add_player
    assert_equal 'x', ConnectFour.add_player('x').name
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

  def test_action_player
    playing_area = ConnectFour.create_playing_area
    player = ConnectFour.add_player('x')
    ConnectFour.action(player.name,2)                       # player(x) place a x in column 2

    assert_equal 'x', playing_area[0][1]          # 1 is the 2nd column because an array starts at 0
  end

  def test_is_winner
    playing_area = ConnectFour.create_playing_area
    player1 = ConnectFour.add_player('x')
    #player2 = ConnectFour.add_player('o')
    ConnectFour.action(player1,2)                       # player(x) place a x in column 2
    ConnectFour.action(player1,3)
    ConnectFour.action(player1,4)
    ConnectFour.action(player1,5)
    assert_equal player1, ConnectFour.is_winner
  end

  def test_check_action
    assert_equal false, ConnectFour.check_action(9)

  end


end
