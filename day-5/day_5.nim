import json, strutils

let pileFile = parseFile("./data/piles.json")
var piles: seq[seq[string]] = @[]
for inp in pileFile["piles"]:
  var newPile: seq[string] = @[]
  for c in inp.to(string):
    let newC: string = $c
    newPile.add(newC)
  piles.add(newPile)

type
  Move = object
    amount: int
    startRow: int
    endRow: int

proc newMove(amount, startRow, endRow: int): Move =
  result.amount = amount
  result.startRow = startRow - 1
  result.endRow = endRow - 1

let inputFile = readFile("./data/input.txt").multiReplace(
  ("move ", ""),
  (" from ", ","),
  (" to ", ",")
).split("\n")

template reverse(group: seq[string]) =
  var newGroup: seq[string] = @[]
  for i in countdown(group.len() - 1, 0):
    newGroup.add(group[i])
  group = newGroup

for i in inputFile:
  let iSplit = i.split(",")
  let input = newMove(iSplit[0].parseInt(),
   iSplit[1].parseInt(), iSplit[2].parseInt())
  echo input
  var storage: seq[string] = @[]
  for n in countup(1, input.amount):
    if piles[input.startRow].len() > 0:
      storage.add(piles[input.startRow].pop())
  storage.reverse()
  for s in countup(0, storage.len() - 1):
    piles[input.endRow].add(storage.pop())

var topCrates: seq[string] = @[]
for t in piles:
  if t.len() > 0:
    topCrates.add(t[t.len() - 1])

echo topCrates.join("")