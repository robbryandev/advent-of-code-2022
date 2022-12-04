import * as fs from "fs";

const input: string[] = fs.readFileSync("./data/input.txt", "utf-8").split("\n");

function isConflict(groupOne: string, groupTwo: string): [boolean, boolean] {
  const splitOne: string[] = groupOne.split("-");
  const splitTwo: string[] = groupTwo.split("-");
  const valOne: [number, number] = [parseInt(splitOne[0]), parseInt(splitOne[1])];
  const valTwo: [number, number] = [parseInt(splitTwo[0]), parseInt(splitTwo[1])];

  let groupOneRange: number[] = [];
  for (let i = valOne[0]; i <= valOne[1]; i++) {
    groupOneRange.push(i);
  }

  let isIn: boolean = false;
  let fullIn: boolean = false;

  if (groupOneRange.includes(valTwo[0]) || groupOneRange.includes(valTwo[1])) {
    isIn = true;
  }
  if (valTwo[0] >= valOne[0]) {
    fullIn = valTwo[1] <= valOne[1];
  }
  return [fullIn, isIn];
}

let conflicts: number = 0;
let fullConflicts: number = 0;
for (let i in input) {
  const groups: string[] = input[i].split(",");
  const teamOne: string = groups[0];
  const teamTwo: string = groups[1];

  const conOne = isConflict(teamOne, teamTwo);
  const conTwo = isConflict(teamTwo, teamOne);
  if (conOne[0] || conTwo[0]) {
    fullConflicts++;
  }
  if (conOne[0] || conOne[1] || conTwo[0] || conTwo[1]) {
    conflicts++;
  }
}

console.log(fullConflicts);
console.log(conflicts);