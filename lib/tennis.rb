class Tennis 
  def initialize
    @player1score = 0
    @player2score = 0
    @diff = 0
  end

  def player1_scored
    @player1score += 1
  end

  def player2_scored
    @player2score += 1
  end

  def result
    difference
    if !winner.nil?
      winner
    elsif @player1score >= 3 && @player2score >= 3
      deuce
    else
      SCORES[@player1score] + "-" + SCORES[@player2score]
    end
  end

  private

  SCORES = {0 => "Love", 1 => "Fifteen", 2 => "Thirty", 3 => "Forty"}

  def deuce
    if @diff == 1
      "Advantage Player 1"  
    elsif @diff == -1
      "Advantage Player 2"
    else
      "Deuce"
    end
  end

  def winner
    player_wins_with_advantage = @diff.abs == 2 && @player1score >= 3 && @player2score >=3
    player1_won_without_advantage = @player1score == 4 && @player2score < 3
    player2_won_without_advantage = @player2score == 4 && @player1score < 3
    player_wins_without_advantage = player1_won_without_advantage || player2_won_without_advantage
    if player_wins_with_advantage || player_wins_without_advantage
      return "Player1 wins" if @player1score > @player2score
      return "Player2 wins" if @player1score < @player2score
    end
  end

  def difference 
    @diff = @player1score - @player2score
  end
end



