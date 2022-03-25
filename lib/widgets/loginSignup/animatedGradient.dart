import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  void start() {
    if (mounted)
      setState(
        () {
          index = index + 1;
          bottomColor = Colors.purple;
        },
      );
  }

  List<Color> colorList = [
    Colors.purple,
    Colors.red,
    Colors.yellow,
    Colors.blue
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.purple;
  Color middleColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.topLeft;
  Alignment end = Alignment.bottomRight;

  @override
  void initState() {
    bottomColor = Colors.purple;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (mounted)
        setState(() {
          bottomColor = Colors.purple;
          index = index++;
        });
    });
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 2),
            onEnd: () {
              if (mounted)
                setState(() {
                  index = index + 1;
                  // animate the color
                  bottomColor = colorList[index % colorList.length];
                  middleColor = colorList[(index + 1) % colorList.length];
                  topColor = colorList[(index + 2) % colorList.length];

                  //// animate the alignment
                  // begin = alignmentList[index % alignmentList.length];
                  // end = alignmentList[(index + 2) % alignmentList.length];
                });
            },
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: begin,
                    end: end,
                    colors: [bottomColor, middleColor, topColor])),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (mounted)
                  setState(
                    () {
                      bottomColor = Colors.purple;
                    },
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class AnimatedGradient extends StatefulWidget {
//   @override
//   _AnimatedGradientState createState() => _AnimatedGradientState();
// }

// class _AnimatedGradientState extends State<AnimatedGradient> {
//   List<Color> colorList = [
//     Colors.yellow,
//     Colors.red,
//     Colors.pink,
//     Colors.purple
//   ];
//   List<Alignment> alignmentList = [
//     Alignment.bottomLeft,
//     Alignment.bottomRight,
//     Alignment.topRight,
//     Alignment.topLeft,
//   ];
//   int index = 0;
//   Color color1 = Colors.yellow;
//   Color color2 = Colors.red;
//   Color color3 = Colors.pink;
//   Color color4 = Colors.purple;

//   Alignment begin = Alignment.bottomRight;
//   Alignment end = Alignment.topLeft;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AnimatedContainer(
//           duration: Duration(seconds: 6),
//           curve: Curves.slowMiddle,
//           onEnd: () {
//             setState(() {
//               index = index + 1;
//               // animate the color
//               color1 = colorList[index % colorList.length];
//               color2 = colorList[(index + 1) % colorList.length];
//               color3 = colorList[(index + 2) % colorList.length];
//               color4 = colorList[(index + 3) % colorList.length];

//               //// animate the alignment
//               // begin = alignmentList[index % alignmentList.length];
//               // end = alignmentList[(index + 2) % alignmentList.length];
//             });
//           },
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             begin: begin,
//             end: end,
//             colors: [color1, color2, color3, color4],
//           )),
//         ),
//         Positioned.fill(
//           child: IconButton(
//             icon: Icon(Icons.play_arrow),
//             onPressed: () {
//               setState(() {
//                 color1 = Colors.red;
//               });
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
