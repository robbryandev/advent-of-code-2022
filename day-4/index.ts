import * as fs from "fs";

const input: string[] = fs.readFileSync("./data/input.txt", "utf-8").split("\n");

function isConflict(groupOne: string, groupTwo: string): boolean {
  const splitOne: string[] = groupOne.split("-");
  const splitTwo: string[] = groupTwo.split("-");
  const valOne: [number, number] = [parseInt(splitOne[0]), parseInt(splitOne[1])];
  const valTwo: [number, number] = [parseInt(splitTwo[0]), parseInt(splitTwo[1])];

  if (valTwo[0] >= valOne[0]) {
    return valTwo[1] <= valOne[1];
  } else {
    return false;
  }
}

let conflicts: number = 0;
for (let i in input) {
  const groups: string[] = input[i].split(",");
  const teamOne: string = groups[0];
  const teamTwo: string = groups[1];

  if (isConflict(teamOne, teamTwo) || isConflict(teamTwo, teamOne)) {
    conflicts++;
  }
}

console.log(conflicts);