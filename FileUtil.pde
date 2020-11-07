void loadFile(String path) {
  String[] file = loadStrings(sketchPath(path));

  spaces = new Space[numSpaces];
  int sk = 0;
  for (int i = 0; i < file.length; i++) {
    if ((args = file[i].split(",")).length > 0) {
      if (args[0].charAt(0) == '/') {
         sk++;
         continue;
      }
      
      switch (args[0]) {
      case "EMPTY":
        spaces[i - sk] = createEmpty();
        println(i, sk);

        break;
      case "CHANCE":
        spaces[i - sk] = createChance();

        break;
      case "COMMUNITY":
        spaces[i - sk] = createCommunity();

        break;
      case "RESIDENT":
        assert args.length > 3;

        int[] houseCosts = new int[args.length - 4];
        for (int j = 0; j < houseCosts.length; j++)
          houseCosts[j] = int(args[j + 4]);

        spaces[i - sk] = createResident(args[1], int(args[2]), int(args[3]), houseCosts);

        break;
      case "RAILROAD":
        assert args.length > 1;

        spaces[i - sk] = createRailroad(args[1]);

        break;
      case "UTILITY":
        assert args.length > 1;

        spaces[i - sk] = createUtility(args[1]);

        break;
      default:
        System.err.println("Error Parsing Line " + i + ", '" + file[i] + "'!");
        break;
      }
    }
  }

  for (int i = 0; i < numSpaces; i++)
    if (spaces[i] == null)
      spaces[i] = createEmpty();
}
