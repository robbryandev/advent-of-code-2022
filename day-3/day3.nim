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

proc findCommon(valOne, valTwo, valThree: string): char =
  for l in valOne:
    if l in valTwo and l in valThree:
      return l
  for l in valTwo:
    if l in valOne and l in valThree:
      return l
  for l in valThree:
    if l in valTwo and l in valOne:
      return l

proc splitThrees(inputVal: seq[string]): seq[seq[string]] =
  var sackCount = 0
  var group: seq[string]
  for i in inputVal:
    sackCount.inc(1)
    group.add(i)
    if sackCount == 3:
      result.add(group)
      group = @[]
      sackCount = 0

var total = 0
for g in input.splitThrees():
  let common = findCommon(g[0], g[1], g[2])
  total.inc(getNumMap(upper, lower, common).val)

echo total