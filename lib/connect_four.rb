module ConnectFour

  #require './player'
  require 'player'

  def self.hello_world
    "hello world"
  end

  def self.add_player(name)
    player = Player.new name
  end

  def self.create_playing_area
    rows=8
    cols=8
    @playing_area = Array.new(cols,'-') {Array.new(rows,'-')}
  end

  @player1 = add_player('x')
  @player2 = add_player('o')

  def self.start_game

    while(!is_winner) do
      print "Ihr Eingabe bitte Player #{active_player.name}:"
      eingabe=gets
    end
  end

  def self.active_player
    changer = 1
    if changer ==1
      @player1
      changer=0
      active = @player1
    else
      @player2
      changer=1
      active = @player2
    end
  active
  end

  def self.action(player_sign, col)
    @playing_area[col-1][0]=player_sign
  end

end
