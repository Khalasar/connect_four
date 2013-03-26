module ConnectFour

  require './player'
  #require 'player'

  # invoke this method to start the game
  def self.start_game
    @player1 = add_player('x')
    @player2 = add_player('o')

    create_playing_area
    @changer =0
    @active = @player1     # player 1 begins
    @winner = false
    while(!@winner) do
      show_playing_area
      puts
      print "Ihr Eingabe bitte Player #{@active.name}:"
      input=gets
      action @active.name,input.to_i-1
    end
    show_playing_area
    puts 'Sieger'
  end

  # a new player with a name will add to the game
  def self.add_player(name)
    player = Player.new name
  end

  # invoke to create the playing area with 8 rows and 8 columns
  def self.create_playing_area
    rows=9
    cols=9
    @playing_area = Array.new(cols,'.') {Array.new(rows,'.')}  # the fields of the area will fill with '.'
  end

  # invoke to show the playing area
  def self.show_playing_area
    puts
    puts '12345678'
    x=@playing_area.size-2
    while x>=0 do
      y=0
      while y<@playing_area[0].size-1 do
        print @playing_area[x][y]
        y = y+1
      end
      puts
      x = x-1
    end

  end

  # invoke to change the active player
  def self.active_player

    if @changer ==1
      @changer=0
      @active = @player1
    else
      @changer=1
      @active = @player2
    end
  @active
  end

  # invoked when a player do an entry
  def self.action(player_sign, col)
    if check_action col
      0.upto(7) do |row|
       if @playing_area[row][col]=='.'
         @playing_area[row][col]=player_sign
         @winner=is_winner(player_sign, col, row)
         active_player
         break
       else
         #@active
        end
      end
    else
         puts 'Falscher Spielzug!'
           #@active
    end
  end

  # invoked to check if the entry from one player was a correct move
  def self.check_action(col)
    if col>=0 && col <8
      true
    else
      false
    end
  end

  # this method test, if a player has won the game
  def self.is_winner(player_sign, col,row)
    counter=1
    winner=false

      # horizontal
      1.upto(3) do |x|
        if @playing_area[row][col-x]==player_sign
            counter = counter+1
        else
          break
        end
      end
      1.upto(3) do |x|
        if @playing_area[row][col+x]==player_sign
          counter = counter+1
        else
          break
        end

      end
      # vertical
      if counter<4
        counter=1
        1.upto(3) do |x|

            if @playing_area[row+x][col]==player_sign
              counter = counter+1
            else
              break
            end

        end
        1.upto(3) do |x|
          if @playing_area[row-x][col]==player_sign
            counter = counter+1
          else
            break
          end
        end
      end
      #diagonal
      if counter<4
      counter=1
      1.upto(3) do |x|
        if @playing_area[row-x][col-x]==player_sign
          counter = counter+1
        else
          break
        end
      end
      1.upto(3) do |x|
        if @playing_area[row+x][col+x]==player_sign
          counter = counter+1
        else
          break
        end
      end

      end
      if counter ==4
        winner = true
      end



    winner
  end

  start_game

end
