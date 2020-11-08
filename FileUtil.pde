void loadFile(String path) {
  String[] file = loadStrings(sketchPath(path));

  spaces = new Space[numSpaces];
  int sk = 0;
  for (int i = 0; i < file.length; i++) {
    if ((args = file[i].split(",")).length > 0) {
      if (args[0].charAt(0) == '/' || args[0].charAt(0) == '#') {
         sk++;
         continue;
      }
      
      switch (args[0]) {
      case "EMPTY":
        spaces[i - sk] = createEmpty();

        break;
      case "CHANCE":
        spaces[i - sk] = createChance();

        break;
      case "COMMUNITY":
        spaces[i - sk] = createCommunity();

        break;
      case "RESIDENT":
        assert args.length > 3;

        spaces[i - sk] = createResident(args[1], int(args[2].substring(1)), int(args[3].substring(1)), calcRents(int(args[4].substring(1))));

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
        exit();
        break;
      }
    }
  }

  for (int i = 0; i < numSpaces; i++)
    if (spaces[i] == null)
      spaces[i] = createEmpty();
}

int[] calcRents(int r) {
  return new int[] { r, r * 5, r * 15, r * 45, r * 80, r * 125 };
}
