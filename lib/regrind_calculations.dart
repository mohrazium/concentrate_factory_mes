class RegrandCaculations {
  RegrandCaculations(
      {this.normalPower = 0,
      this.userPower = 0,
      this.currentPower = 0,
      this.savedPocket = 0,
      this.chargedPocket = 0});

  double normalPower = 0;

  double userPower = 0;

  double currentPower = 0;

  double savedPocket = 0;

  double savedPocketCapacity = 0;

  double chargedPocket = 0;

  void calculate() {
    if (userPower != normalPower) {
      if (userPower > normalPower) {
        currentPower = userPower - normalPower;

        if (currentPower >= 30 && currentPower <= 50) {
          savedPocket = 1;
          chargedPocket = 0;
        }
      } else if (userPower < normalPower) {
        currentPower = normalPower - userPower;

        if (currentPower >= 0 && currentPower <= 10) {
          savedPocket = 2;
          chargedPocket = 1;
        } else if (currentPower > 10 && currentPower <= 20) {
          chargedPocket = 1;
          savedPocket = 0;
        } else if (currentPower >= 25) {
          chargedPocket = (currentPower / 30) + 1;

          savedPocket = 1;

          //chargedPocket = savedPocket ~/ 2;
        } else {}
      }
    }

    print("Charged Pocket= $chargedPocket");

    print("Difference of current power= $currentPower");

    print("Saved pocket = $savedPocket");
  }
}
