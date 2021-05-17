input_array = ["1,3,7",
"1,6,1",
"1,8,2",
"2,1,5",
"2,2,4",
"2,7,1",
"2,8,3",
"3,2,1",
"3,6,5",
"4,2,7",
"4,9,5",
"5,1,3",
"5,4,5",
"5,6,6",
"5,9,4",
"6,1,9",
"6,8,7",
"7,4,8",
"7,8,9",
"8,2,6",
"8,3,1",
"8,8,4",
"8,9,2",
"9,2,2",
"9,4,6",
"9,7,7",
]

matrix = [ ['.' for _ in range(9)] for _ in range(9) ]
#  loop_choice = "Y"
#  while loop_choice == "Y" or loop_choice == "y":
#      user_input = list(map(int,input("Format is Row, Column, Value\n").split(",")))
#      matrix[user_input[0] - 1][user_input[1] - 1] = str(user_input[2])
#      loop_choice = input("Do you want to continue\n")
#  print("".join([item for sublist in matrix for item in sublist]))

for i in input_array:
    user_input = list(map(int,i.split(',')))
    matrix[user_input[0] - 1][user_input[1] - 1] = str(user_input[2])
print("".join([item for sublist in matrix for item in sublist]))
