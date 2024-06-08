import 'package:concentrate_factory_mes/bullet_charge_calculations.dart';
import 'package:flutter/material.dart';

enum Buket {
  buket3Ton('باکت ۳ تنی', 3),
  buket5Ton('باکت ۵ تنی', 5);

  const Buket(this.label, this.value);

  final String label;
  final int value;
}

enum SavedBuketCapacity {
  buket13('یک باکت ۳ تنی', 3),
  buket23('دو باکت ۳ تنی', 6),
  buket33('سه باکت ۳ تنی', 9),
  buket15('یک باکت ۵ تنی', 5),
  buket25('دو باکت ۵ تنی', 10),
  buket35('سه باکت ۵ تنی', 15);

  const SavedBuketCapacity(this.label, this.value);

  final String label;
  final int value;
}

class RegrindView extends StatefulWidget {
  final String regrindName;
  final int regrindPower;

  const RegrindView(
      {super.key,
      required this.title,
      required this.regrindName,
      required this.regrindPower});

  final String title;

  @override
  State<RegrindView> createState() => _RegrindViewState();
}

class _RegrindViewState extends State<RegrindView> {
  @override
  void initState() {
    _initValues();
    super.initState();
  }

  RegrandCaculations regrindCalculations = RegrandCaculations();
  final TextEditingController _textEditingController =
      TextEditingController(text: "1300");
  final TextEditingController buketController = TextEditingController();
  final TextEditingController savedBuketCapacityController =
      TextEditingController();

  void _calculation() {
    setState(() {
      try {
        regrindCalculations.calculate();
      } catch (ignored) {
        //ignore
      }
    });
  }

  void _resetValues() {
    setState(() {
      regrindCalculations.clear();
      _initValues();
    });
  }

  void _initValues() {
    regrindCalculations.normalPower = widget.regrindPower;
    regrindCalculations.userPower = widget.regrindPower;
    regrindCalculations.savedBuketCapacity = SavedBuketCapacity.buket23.value;
    regrindCalculations.buketTonnageCapacity = Buket.buket3Ton.value;
    _textEditingController.text = "${widget.regrindPower}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${regrindCalculations.chargedBuket}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${regrindCalculations.savedBuket}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' : شارژ گلوله ',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' : ذخیره گلوله ',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                maxLength: 6,
                controller: _textEditingController,
                onChanged: (val) {
                  regrindCalculations.userPower =
                      int.tryParse(_textEditingController.text.trim()) ?? widget.regrindPower;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintTextDirection: TextDirection.rtl,
                  hintText: 'قدرت فعلی ریگرند را وارد کنید',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: DropdownMenu<SavedBuketCapacity>(
                width: 300,
                initialSelection: SavedBuketCapacity.buket23,
                controller: savedBuketCapacityController,
                requestFocusOnTap: true,
                label: const Text('ظرفیت ذخیره گلوله'),
                onSelected: (SavedBuketCapacity? cap) {
                  setState(() {
                    regrindCalculations.savedBuketCapacity = cap?.value ?? 3;
                  });
                },
                dropdownMenuEntries: SavedBuketCapacity.values
                    .map<DropdownMenuEntry<SavedBuketCapacity>>(
                        (SavedBuketCapacity cap) {
                  return DropdownMenuEntry<SavedBuketCapacity>(
                    label: cap.label,
                    value: cap,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: DropdownMenu<Buket>(
                width: 300,
                initialSelection: Buket.buket3Ton,
                controller: buketController,
                requestFocusOnTap: true,
                label: const Text('باکت مورد استفاده'),
                onSelected: (Buket? buket) {
                  setState(() {
                    regrindCalculations.buketTonnageCapacity =
                        buket?.value ?? 3;
                  });
                },
                dropdownMenuEntries:
                    Buket.values.map<DropdownMenuEntry<Buket>>((Buket buket) {
                  return DropdownMenuEntry<Buket>(
                    label: buket.label,
                    value: buket,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    onPressed: () => _resetValues(),
                    icon: const Icon(Icons.refresh),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _calculation(),
                    child: const Text("محاسبه"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
