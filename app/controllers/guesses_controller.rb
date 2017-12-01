class GuessesController < ApplicationController
  @@c1 = nil
  @@c2 = nil
  @@c3 = nil
  @@c4 = nil
  
  def set_code(n1, n2, n3, n4)
    @@c1 = n1
    @@c2 = n2
    @@c3 = n3
    @@c4 = n4
  end
  
  def new
  end
  

  def val_str(num)
    case num
    when 0
      return "red"
    when 1
      return "green"
    when 2
      return "blue"
    when 3
      return "yellow"
    when 4
      return "cyan"
    when 5
      return "magenta"
    else
      return 'red'
    end
  end
  
  def str_val (c)
    case c
    when 'r' #red
      return 0
    when 'g' #green
      return 1
    when 'b' #blue
      return 2
    when 'y' #yellow
      return 3
    when 'c' #cyan
      return 4
    when 'm' #magenta
      return 5
    else
      return 0
    end
  end
  
  def show
     Guess.all
  end
  
  def is_correct(result, col, val)
    
    same_color = 0
    white = 0
    black = 0
    
    if(val == @@c1)
      if(col == 1)
        return 'black'
      else
        return 'white'
      end
    end
    if(val == @@c2)
      if(col == 2)
        return 'black'
      else
        return 'white'
      end
    end
    if(val == @@c3)
      if(col == 3)
        return 'black'
      else
        return 'white'
      end
    end
    if(val == @@c4)
      if(col == 4)
        return 'black'
      else
        return 'white'
      end
    end
    
    return ''
  end
  
  def check_choice
    if(Guess.all.length == 10)
      Guess.all.delete_all
      set_code(nil, nil, nil, nil)
      return "You have lost! Enter another guess to play again"
    end
    
    if(params[:Guess] == nil)
      set_code(nil, nil, nil, nil)
      Guess.all.delete_all
      return nil
    else
      #set up the guess randomly whenever an empty guess is made
      if(@@c1 == nil)
        set_code(rand(0..5), rand(0..5), rand(0..5), rand(0..5))
      end
      
      c1 = str_val(params[:Guess][:choice1][0..0])
      c2 = str_val(params[:Guess][:choice2][0..0])
      c3 = str_val(params[:Guess][:choice3][0..0])
      c4 = str_val(params[:Guess][:choice4][0..0])
      
      result = []
      
      i = 0
      [c1,c2,c3,c4].each do |c|
        
        result.push(is_correct(result, i, c))
        i = i + 1
      end
        
      if(result == ['black','black','black','black'])
        Guess.all.delete_all
        set_code(nil, nil, nil, nil)
        return "You win! Enter another guess to play again"
      end
      
      guess = Guess.new(:c1 => c1, :c2 => c2, :c3 => c3, :c4 => c4)
      guess.save

 
      return result
    end
  end
  
  helper_method :check_choice, :show, :val_str
end
