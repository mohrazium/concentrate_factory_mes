class RegrandCaculations {
  int normalPower = 0;
  int userPower = 0;
  int differenceOfPower = 0;
  int savedBuket = 0;
  int savedBuketCapacity = 0;
  int chargedBuket = 0;
  int buketTonnageCapacity = 0;

  void clear() {
    normalPower = 0;
    userPower = 0;
    differenceOfPower = 0;
    savedBuket = 0;
    savedBuketCapacity = 0;
    chargedBuket = 0;
    buketTonnageCapacity = 0;
  }

  void calculate() {
    if (userPower != normalPower) {
      if (userPower > normalPower) {
        differenceOfPower = userPower - normalPower;

        if (differenceOfPower >= 30 && differenceOfPower <= 50) {
          chargedBuket = 0;
          if (savedBuketCapacity > 0) {
            savedBuket = savedBuketCapacity ~/ buketTonnageCapacity;
          }
        }
      } else if (userPower < normalPower) {
        differenceOfPower = normalPower - userPower;
        if (differenceOfPower > 30) {
          BulletChargeCalculations blc = BulletChargeCalculations(
              differenceOfPower: differenceOfPower,
              buketTonnage: buketTonnageCapacity);
          chargedBuket = blc.calculate();
          if (savedBuketCapacity > 0) {
            savedBuket = savedBuketCapacity ~/ buketTonnageCapacity;
          }
        }

        if (savedBuketCapacity > 0) {
          savedBuket = (savedBuketCapacity ~/ buketTonnageCapacity) ~/ 2;
        }
        // if (currentPower >= 0 && currentPower <= 10) {
        //   savedPocket = 2;
        //   chargedPocket = 1;
        // } else if (currentPower > 10 && currentPower <= 20) {
        //   chargedPocket = 1;
        //   savedPocket = 0;
        // } else if (currentPower >= 25) {
        //   chargedPocket = (currentPower / 30) + 1;
        //
        //   savedPocket = 1;
        //
        //   //chargedPocket = savedPocket ~/ 2;
        // } else {}
      }
    } else {
      if (savedBuketCapacity > 0) {
        savedBuket = savedBuketCapacity ~/ buketTonnageCapacity;
      }
    }

    print("Charged Pocket= $chargedBuket");

    print("Difference of current power= $differenceOfPower");

    print("Saved pocket = $savedBuket");
  }
}

class BulletChargeCalculations {
  final int differenceOfPower;
  final int buketTonnage;

  BulletChargeCalculations(
      {required this.differenceOfPower, required this.buketTonnage});

  int calculate() {
    return _calculate_buket(
        buketTonnage, _bulletTonnageFromPower(differenceOfPower));
  }
}

num _bulletTonnageFromPower(int differenceOfPower) =>
    (differenceOfPower / 10) * 1000;

int _calculate_buket(int buketTonnage, num bulletTonnage) {
  int buckets = 0;

  double bucketsNeeded = bulletTonnage / (buketTonnage * 1000);

  buckets = bucketsNeeded.toInt();
  int floatNum = int.tryParse(bucketsNeeded.toString().split(".")[1]) ?? 0;

  if (floatNum > 7) {
    buckets++;
  }

  return buckets;
}
