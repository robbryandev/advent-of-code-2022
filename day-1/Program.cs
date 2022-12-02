namespace Calories {
  class Calories {
    static void Main() {
      string[] inputOne = File.ReadAllText("./data/input.txt").Split("\n");
      Group elfGroup = new Group();
      Elf currentElf = new Elf();
      foreach (string i in inputOne) {
        if (i == "") {
          elfGroup.NewElf(currentElf);
          currentElf = new Elf();
        } else {
          currentElf.NewItem(i);
        }
      }
      Elf[] topElves = elfGroup.GetHighest();
      int total = 0;
      foreach (Elf e in topElves) {
        int topTotal = e.GetTotal();
        Console.WriteLine(topTotal);
        total += topTotal;
      }
      Console.WriteLine(total);
    }
  }
}