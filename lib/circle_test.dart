// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/material.dart';
import 'package:animated_rotation/animated_rotation.dart' as anim;

class ExampleWidget extends StatefulWidget {
  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  int length = 5;
  double innerSpacingDivider = 10;
  double radiusOfItemDivider = 6;
  double centerWidgetRadiusDivider = 3;

  double startAngleDeg = 360;
  double totalArchDeg = 360;
  bool isClockwise = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Circular Widgets'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() => length++);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() => length--);
              },
            ),
          ],
        ),
        // Use Layout builder for responsive behaviour
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListTile(
                title: const Text('Responsive Inner Spacing'),
                subtitle: Slider(
                    min: 1,
                    max: 30,
                    divisions: 29,
                    label: innerSpacingDivider.toStringAsFixed(2),
                    value: innerSpacingDivider,
                    onChanged: (newVal) {
                      print(newVal);
                      setState(() => innerSpacingDivider = newVal);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListTile(
                title: const Text('Start angle'),
                subtitle: Slider(
                    min: -360,
                    max: 360,
                    label: startAngleDeg.toStringAsFixed(2),
                    value: startAngleDeg,
                    onChanged: (newVal) {
                      print(newVal);
                      setState(() => startAngleDeg = newVal);
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListTile(
                title: const Text('Total Arch'),
                subtitle: Slider(
                  min: 0,
                  max: 360,
                  label: totalArchDeg.toStringAsFixed(2),
                  value: totalArchDeg,
                  onChanged: (newVal) => setState(() => totalArchDeg = newVal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CheckboxListTile(
                title: const Text('Is Clockwise ?'),
                value: isClockwise,
                onChanged: (newVal) {
                  setState(() {
                    isClockwise = newVal ?? true;
                  });
                },
              ),
            ),
            //Wrap with Expanded for Layout Builder to work, since it requires bounded width and height
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  var smallestBoundary =
                      min(constraints.maxHeight, constraints.maxWidth);
                  return anim.AnimatedRotation(
                    angle: startAngleDeg,
                    child: CircularWidgets(
                      // startAngleDeg: startAngleDeg,
                      // totalArchDeg: totalArchDeg,
                      isClockWise: isClockwise,
                      itemsLength: length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            startAngleDeg = ((8 - index) * 360 / 8) - 180;
                            print(startAngleDeg);
                            // print(totalArchDeg);
                            setState(() {});
                          },
                          child: SingleCircle(
                            txt: index.toString(),
                            color: Colors.grey,
                          ),
                        );
                      },
                      innerSpacing: smallestBoundary / innerSpacingDivider,
                      radiusOfItem: smallestBoundary / radiusOfItemDivider,
                      centerWidgetRadius:
                          smallestBoundary / centerWidgetRadiusDivider,
                      // centerWidgetBuilder: (context) {
                      //   return SingleCircle(
                      //     txt: 'Center',
                      //     color: Colors.red,
                      //   );
                      // },
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListTile(
                title: const Text('Responsive Center Radius'),
                subtitle: Slider(
                  min: 1,
                  max: 5,
                  divisions: 16,
                  label: centerWidgetRadiusDivider.toStringAsFixed(2),
                  value: centerWidgetRadiusDivider,
                  onChanged: (newVal) =>
                      setState(() => centerWidgetRadiusDivider = newVal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListTile(
                title: const Text('Responsive Item Radius'),
                subtitle: Slider(
                  min: 1,
                  max: 20,
                  // divisions: 18,
                  label: radiusOfItemDivider.toStringAsFixed(2),
                  value: radiusOfItemDivider,
                  onChanged: (newVal) =>
                      setState(() => radiusOfItemDivider = newVal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCircle extends StatelessWidget {
  final String txt;
  final Color color;
  const SingleCircle({
    Key? key,
    required this.txt,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Center(child: Text(txt)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
