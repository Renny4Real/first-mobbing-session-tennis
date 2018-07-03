require 'tennis'

describe Tennis do
  let(:new_game) {Tennis.new}
  context "given no player has scored" do
    it "returns love-love" do
      expect(new_game.result).to eq("Love-Love")
    end
  end

  context "given player one has scored" do
    it "returns fifteen-love" do
      new_game.player1_scored
      expect(new_game.result).to eq("Fifteen-Love")
    end
  end

  context "given player two scored" do 
    it "returns love-fifteen" do 
      new_game.player2_scored
      expect(new_game.result).to eq("Love-Fifteen")
    end
  end

  context "given player two scored twice" do
    it "returns love-thirty" do
      2.times {new_game.player2_scored}
      expect(new_game.result).to eq("Love-Thirty")
    end
  end

  context "given player one has scored three times" do
    it "returns forty-love" do
      3.times {new_game.player1_scored}
      expect(new_game.result).to eq("Forty-Love")
    end
  end

  context "given both players have scored three times" do
    it "returns deuce" do
      3.times do
        new_game.player1_scored 
        new_game.player2_scored
      end
      
      expect(new_game.result).to eq("Deuce")
    end
  end

  context "player one scores whilst in Deuce" do
    it "return advantage player 1" do 
      3.times do
        new_game.player1_scored
        new_game.player2_scored
      end

      new_game.player1_scored
      expect(new_game.result).to eq("Advantage Player 1")
    end
  end


  context "player two scores whilst in Deuce" do
    it "return advantage player 2" do 
      3.times do
        new_game.player1_scored
        new_game.player2_scored
      end

      new_game.player2_scored
      expect(new_game.result).to eq("Advantage Player 2")
    end
  end  


  context "player two scores whilst player one has advantage" do
    it "returns deuce" do 
      4.times do
        new_game.player1_scored
        new_game.player2_scored
      end
      
      expect(new_game.result).to eq("Deuce")
    end
  end  

  context "player one scores 4 times in a row" do
    it "returns player 1 wins" do 
      4.times do
        new_game.player1_scored
      end

      expect(new_game.result).to eq("Player1 wins")
    end
  end

  context "player two scores 4 times in a row" do
    it "returns player 2 wins" do 
      4.times do
        new_game.player2_scored
      end

      expect(new_game.result).to eq("Player2 wins")
    end
  end

  context "player one scores whilst in advantage" do
    it "returns player 1 wins" do 
      3.times do
        new_game.player1_scored
        new_game.player2_scored
      end
      
      2.times do
        new_game.player1_scored
      end

      expect(new_game.result).to eq("Player1 wins")
    end
  end

  context "player two scores whilst in advantage" do
    it "returns player 2 wins" do 
      3.times do
        new_game.player1_scored
        new_game.player2_scored
      end
      
      2.times do
        new_game.player2_scored
      end

      expect(new_game.result).to eq("Player2 wins")
    end
  end
end