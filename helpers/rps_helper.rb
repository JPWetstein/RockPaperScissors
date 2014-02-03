module RpsHelper
  def winning_combos
    return {Rock: "Scissors", Paper: "Rock", Scissors: "Paper"}
  end
  
  def shoot_result throw, computer_throw
    if throw.eql? computer_throw
      return "Tie"
    elsif winning_combos[throw.to_sym].eql? computer_throw
      return "Win"
    else
      return "Lose"
    end
  end
  
  def computer_throw
    ["Rock", "Scissors", "Paper"].sample
  end
end