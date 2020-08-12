#! /usr/bin/awk -f

#----------------------   function tic_tac_display    ---------------------------------
function tic_tac_display(){
  for(i=1; i<9; i=i+3)
  {
    printf "  "arr[i]" | " arr[i+1]" | "arr[i+2] "  \n"
    print "--------------"
  }
}

#----------------------   function check_winning_condition  ---------------------------------
function check_win_condition(turn){
  if((arr[1]==arr[2] && arr[2]==arr[3]) ||(arr[4]==arr[5] && arr[5]==arr[6]) ||(arr[7]==arr[8] && arr[9]==arr[8]) ||(arr[1]==arr[4] && arr[4]==arr[7]) ||(arr[2]==arr[5] && arr[5]==arr[8]) ||(arr[3]==arr[6] && arr[6]==arr[9]) ||(arr[1]==arr[5] && arr[5]==arr[9]) ||(arr[7]==arr[5] && arr[5]==arr[3])){
    print turn " Win"
    exit 0
  }
  total_turn_played = total_turn_played + 1  # increament of total turn played
  if (total_turn_played == 9){               # check if all turn played
    print "Match Tie"
    exit 0
  }
}

#----------------------   BEGIN Block   ---------------------------------
BEGIN{
  for (i=0; i<10; i++){
    arr[i] = i
  }
  tic_tac_display()
  turn = "Player 1"
  total_turn_played = 0
}

#----------------------   Main Block  ---------------------------------
{
  if (arr[$1] == "\033[1;31mX\033[0m" || arr[$1] == "\033[1;33mO\033[0m" || $1 > 9 || $1 < 1){    # Check input if it is valid or not
    print "Invalid Input"
  }
  else {
    if (turn == "Player 1"){            # this is player 1 turn 
      arr[$1] = "\033[1;31mX\033[0m" 
      tic_tac_display()
      check_win_condition(turn)
      turn = "Player 2"
    }
    else {                              # this is player 2 turn
      arr[$1] = "\033[1;33mO\033[0m"
      tic_tac_display()
      check_win_condition(turn)
      turn = "Player 1"
    }
  }
}
