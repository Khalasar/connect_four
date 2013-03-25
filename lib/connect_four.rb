module ConnectFour

  require './player'
  #require 'player'

  def self.start_game
    @player1 = add_player('x')
    @player2 = add_player('o')

    create_playing_area
    @changer =0
    @active = @player1
    while(is_winner) do
      show_playing_area()
      puts
      print "Ihr Eingabe bitte Player #{@active.name}:"
      input=gets
      @active = action @active.name,input.to_i
    end
  end

  def self.add_player(name)
    player = Player.new name
  end

  def self.create_playing_area
    rows=8
    cols=8
    @playing_area = Array.new(cols,'.') {Array.new(rows,'.')}
  end

  def self.show_playing_area
    puts
    puts '12345678'
    x=@playing_area.size-1
    while x>=0 do
      y=0
      while y<@playing_area[0].size do
        print @playing_area[x][y]
        y = y+1
      end
      puts
      x = x-1
    end

  end

  def self.active_player

    if @changer ==1
      @player1
      @changer=0
      active = @player1
    else
      @player2
      @changer=1
      active = @player2
    end
  active
  end

  def self.action(player_sign, col)
    if check_action col
    @playing_area[0][col-1]=player_sign
      active_player
    else
         puts 'Falscher Spielzug!'
           @active
    end
  end

  def self.check_action(col)
    if col>0 && col <9
      true
    else
      false
    end
  end

  def self.is_winner
    true
  end

  start_game

end
