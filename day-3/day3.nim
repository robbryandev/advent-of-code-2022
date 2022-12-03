import strutils

type
  NumMap = object
    val: int
    letter: char

proc newNumMap(val: int, letter: char): NumMap =
  result.val = val
  result.letter = letter

var lower, upper: seq[NumMap]

var letterCount = 0
for l in Letters:
  letterCount.inc()
  if l.isLowerAscii:
    upper.add(newNumMap(letterCount, l.toUpperAscii()))
  else:
    lower.add(newNumMap(letterCount, l.toLowerAscii()))

proc getNumMap(u, l: seq[NumMap], c: char): NumMap =
  var loop: seq[NumMap]
  if c.isLowerAscii():
    loop = l
  else:
    loop = u
  
  for m in loop:
    if m.letter == c:
      return m

let input = readFile("./data/input.txt").splitLines(false)

proc half(val: string): seq[string] =
  let halfOne: string = val[0 .. (val.len() / 2 - 1).toInt()]
  let halfTwo: string = val[(val.len() / 2).toInt() .. val.len() - 1]
  result = @[halfOne, halfTwo]


var total = 0
for i in input:
  let sack = i.half()
  for i in countup(0, sack[0].len() - 1):
    if sack[0][i] in sack[1]:
      total.inc(getNumMap(upper, lower, sack[0][i]).val)
      break

echo total