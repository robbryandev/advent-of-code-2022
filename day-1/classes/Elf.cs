namespace Calories {
  class Elf {
    List<int> list = new List<int>();
    public void NewItem(string val) {
      int newVal = int.Parse(val);
      list.Add(newVal);
    }
    public int GetCount() {
      return list.ToArray().Length;
    }
    public int GetTotal() {
      int count = 0;
      foreach (int l in list) {
        count += l;
      }
      return count;
    }
  }
}