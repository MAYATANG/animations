
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('Animation Examples'),
    );

    // 建立App的操作畫面
    final animationWrapper = _AnimationWrapper(
        GlobalKey<_AnimationWrapperState>(), Alignment.bottomCenter);

    var btn = RaisedButton.icon(
      icon: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
        child: Icon(Icons.accessible_forward, color: Colors.white),
      ),
      label: Padding(
        padding: EdgeInsets.only(left: 0, top: 10, right: 20, bottom: 10),
        child: Text('跑喔', style: TextStyle(fontSize: 18, color: Colors.white),),
      ),
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        animationWrapper.setAlignment(Alignment.topCenter);
      },
    );

    final widget = Center(
      child: Container(
        height: 500,
        child: Column(
          children: <Widget>[animationWrapper,
            Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  Alignment _alignment;

  _AnimationWrapper(this._key, this._alignment): super (key: _key);

  @override
  State<StatefulWidget> createState() => _AnimationWrapperState();

  setAlignment(Alignment alignment) {
    _key.currentState.setAlignment(alignment);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = Expanded(
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.slowMiddle,
        child: Icon(Icons.accessible_forward, color: Colors.lightBlue, size: 50),
        alignment: widget._alignment,
        onEnd: () {
          setState(() {
            widget._alignment = Alignment.bottomLeft;
          });
        },
      ),
    );

    return w;
  }

  setAlignment(Alignment alignment) {
    setState(() {
      widget._alignment = alignment;
    });
  }
}


////////////////////////////////////////////
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // 建立AppBar
//     final appBar = AppBar(
//       title: Text('Animation Examples'),
//     );
//
//     // 建立App的操作畫面
//     final animationWrapper = _AnimationWrapper(
//         GlobalKey<_AnimationWrapperState>(), Alignment.bottomCenter);
//
//     var btn = RaisedButton.icon(
//       icon: Padding(
//         padding: EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
//         child: Icon(Icons.airplanemode_active, color: Colors.white),
//       ),
//       label: Padding(
//         padding: EdgeInsets.only(left: 0, top: 10, right: 20, bottom: 10),
//         child: Text('起飛', style: TextStyle(fontSize: 18, color: Colors.white),),
//       ),
//       color: Colors.lightBlue,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       onPressed: () {
//         animationWrapper.setAlignment(Alignment.topCenter);
//       },
//     );
//
//     final widget = Center(
//       child: Container(
//         height: 500,
//         child: Column(
//           children: <Widget>[animationWrapper,
//             Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
//           mainAxisAlignment: MainAxisAlignment.end,
//         ),
//       ),
//     );
//
//     // 結合AppBar和App操作畫面
//     final appHomePage = Scaffold(
//       appBar: appBar,
//       body: widget,
//     );
//
//     return appHomePage;
//   }
// }
//
// class _AnimationWrapper extends StatefulWidget {
//   final GlobalKey<_AnimationWrapperState> _key;
//   Alignment _alignment;
//
//   _AnimationWrapper(this._key, this._alignment): super (key: _key);
//
//   @override
//   State<StatefulWidget> createState() => _AnimationWrapperState();
//
//   setAlignment(Alignment alignment) {
//     _key.currentState.setAlignment(alignment);
//   }
// }
//
// class _AnimationWrapperState extends State<_AnimationWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     var w = Expanded(
//       child: AnimatedContainer(
//         duration: Duration(seconds: 3),
//         curve: Curves.fastOutSlowIn,
//         child: Icon(Icons.airplanemode_active, color: Colors.lightBlue, size: 50),
//         alignment: widget._alignment,
//         onEnd: () {
//           setState(() {
//             widget._alignment = Alignment.bottomCenter;
//           });
//         },
//       ),
//     );
//
//     return w;
//   }
//
//   setAlignment(Alignment alignment) {
//     setState(() {
//       widget._alignment = alignment;
//     });
//   }
// }
////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _count = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             transitionBuilder: (Widget child, Animation<double> animation) {
//               return ScaleTransition(scale: animation, child: child);
//             },
//             child: Text(
//               '$_count',
//               // This key causes the AnimatedSwitcher to interpret this as a "new"
//               // child each time the count changes, so that it will begin its animation
//               // when the count changes.
//               key: ValueKey<int>(_count),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ),
//           ElevatedButton(
//             child: const Text('Increment'),
//             onPressed: () {
//               setState(() {
//                 _count += 1;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   double padValue = 0.0;
//   void _updatePadding(double value) {
//     setState(() {
//       padValue = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         AnimatedPadding(
//           padding: EdgeInsets.all(padValue),
//           duration: const Duration(seconds: 2),
//           curve: Curves.easeInOut,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 5,
//             color: Colors.blue,
//           ),
//         ),
//         Text('Padding: $padValue'),
//         ElevatedButton(
//             child: const Text('Change padding'),
//             onPressed: () {
//               _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
//             }),
//       ],
//     );
//   }
// }

///////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = !selected;
//         });
//       },
//       child: Center(
//         child: AnimatedContainer(
//           width: selected ? 200.0 : 100.0,
//           height: selected ? 100.0 : 200.0,
//           color: selected ? Colors.red : Colors.blue,
//           alignment:
//           selected ? Alignment.center : AlignmentDirectional.topCenter,
//           duration: const Duration(seconds: 2),
//           curve: Curves.fastOutSlowIn,
//           child: const FlutterLogo(size: 75),
//         ),
//       ),
//     );
//   }
// }
