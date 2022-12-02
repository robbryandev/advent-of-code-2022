key = {
  "other": {
    "A": "Rock","B": "Paper", "C": "Scissors"
  },
  "you": {
    "X": "Rock","Y": "Paper", "Z": "Scissors"
  },
  "lose": {
    "Rock": "Scissors", "Paper": "Rock", "Scissors": "Paper"
  },
  "win": {
    "Rock": "Paper", "Paper": "Scissors", "Scissors": "Rock"
  }
}

points = {
  "base": {
    "Rock": 1,
    "Paper": 2,
    "Scissors": 3
  },
  "end": {
    "Lose": 0,
    "Draw": 3,
    "Win": 6
  }
}

def checkWin(other: str, you: str) -> tuple[int, int]:
  otherVal = key["other"][other]
  win = (points["base"][you], points["end"]["Win"])
  lose = (points["base"][you], points["end"]["Lose"])
  draw = (points["base"][you], points["end"]["Draw"])
  if otherVal == you:
    return draw
  if otherVal == "Rock":
    if you == "Paper":
      return win
    else:
      return lose
  elif otherVal == "Paper":
    if you == "Scissors":
      return win
    else:
      return lose
  elif otherVal == "Scissors":
    if you == "Rock":
      return win
    else:
      return lose

def getPoints(state: tuple[int, int]) -> int:
  return state[0] + state[1]

def getValue(other: str, you: str) -> str:
  otherVal = key["other"][other]
  if you == "X":
    return key["lose"][otherVal]
  if you == "Y":
    return otherVal
  if you == "Z":
    return key["win"][otherVal]
    

input = open("./data/input.txt", "r").read()
inputList = input.split("\n")

total = 0
for i in inputList:
  vals = i.split(" ")
  total += getPoints(checkWin(other=vals[0], you=getValue(other=vals[0], you=vals[1])))

print(total)