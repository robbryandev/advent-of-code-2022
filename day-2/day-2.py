key = {
  "other": {
    "A": "Rock","B": "Paper", "C": "Scissors"
  },
  "you": {
    "X": "Rock","Y": "Paper", "Z": "Scissors"
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
  youVal = key["you"][you]
  win = (points["base"][youVal], points["end"]["Win"])
  lose = (points["base"][youVal], points["end"]["Lose"])
  draw = (points["base"][youVal], points["end"]["Draw"])
  if otherVal == youVal:
    return draw
  if otherVal == "Rock":
    if youVal == "Paper":
      return win
    else:
      return lose
  elif otherVal == "Paper":
    if youVal == "Scissors":
      return win
    else:
      return lose
  elif otherVal == "Scissors":
    if youVal == "Rock":
      return win
    else:
      return lose

def getPoints(state: tuple[int, int]) -> int:
  return state[0] + state[1]

input = open("./data/input.txt", "r").read()
inputList = input.split("\n")

total = 0
for i in inputList:
  vals = i.split(" ")
  total += getPoints(checkWin(other=vals[0], you=vals[1]))

print(total)