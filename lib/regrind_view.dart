
import 'package:concentrate_factory_mes/regrind_calculations.dart';
import 'package:flutter/material.dart';

class RegrindView extends StatefulWidget {
  final String regrindName;
  final double regrindPower;
  const RegrindView({super.key, required this.title, required this.regrindName, required this.regrindPower});

  final String title;

  @override
  State<RegrindView> createState() => _RegrindViewState();
}

class _RegrindViewState extends State<RegrindView> {

  @override
  void initState() {
    regrindCalculations.normalPower = widget.regrindPower;
    super.initState();
  }

  RegrandCaculations regrindCalculations = RegrandCaculations();
  final TextEditingController _textEditingController = TextEditingController(text: "0");

  void _calculation() {
    setState(() {
      regrindCalculations.calculate();
    });
  }
void _resetValues(){
    setState(() {
      _textEditingController.text = "${widget.regrindPower}";
      regrindCalculations = RegrandCaculations(normalPower: widget.regrindPower);
    });
}
  @override
  Widget build(BuildContext context) {
    regrindCalculations.normalPower = widget.regrindPower;

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
                      '${regrindCalculations.normalPower}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${regrindCalculations.currentPower}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${regrindCalculations.chargedPocket}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${regrindCalculations.savedPocket}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' : قدرت ',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' : اختلاف قدرت ',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      double.parse(_textEditingController.text.trim());
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
                    icon: const Icon(Icons.reset_tv),
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
