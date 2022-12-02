namespace Calories {
  class Group {
    List<Elf> elves = new List<Elf>();
    public void NewElf(Elf e) {
      elves.Add(e);
    }
    public List<Elf> GetElves() {
      return elves;
    }
    public int ElfCount() {
      return elves.ToArray().Length;
    }
    (Elf, Elf, Elf) highLoop(Elf one, Elf two, Elf three) {
      foreach (Elf e in elves) {
        int eTotal = e.GetTotal();
        if (eTotal > one.GetTotal()) {
          one = e;
        } else {
            if (eTotal > two.GetTotal() && eTotal < one.GetTotal()) {
            two = e;
          } else if (eTotal > three.GetTotal() && eTotal < two.GetTotal()) {
            three = e;
          }
        }
    }
    return (one, two, three);
  }

    public Elf[] GetHighest() {
      Elf highest = new Elf();
      Elf second = new Elf();
      Elf third = new Elf();

      (highest, second, third) = highLoop(highest, second, third);
      (highest, second, third) = highLoop(highest, second, third);

      Elf[] top = new Elf[3];
      top[0] = highest;
      top[1] = second;
      top[2] = third;

      return top;
    }
  }
}