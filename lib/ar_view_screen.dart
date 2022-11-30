import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreen extends StatefulWidget {
  String itemImg;
  ArViewScreen({Key key, this.itemImg}) : super(key: key);

  @override
  _ArViewScreenState createState() => _ArViewScreenState();
}

class _ArViewScreenState extends State<ArViewScreen> {
  ArCoreController arCoreController; //

  void whenArCoreViewCreated(ArCoreController controller) {
    //when native view is created this method executes
    arCoreController = controller; //
    arCoreController.onPlaneTap =
        controlOnPlaneTap; //called when we touch a point on the plane,
    //the argument(parameter) is list of ArCoreHitTestResult(many points)
  }

  void controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;
    addItemImagetoScene(hit);
  }

  Future addItemImagetoScene(ArCoreHitTestResult hitTeastResult) async {
    final bytes = (await rootBundle.load(widget.itemImg)).buffer.asUint8List();

    final imageItem = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 600, height: 600),
      position: hitTeastResult.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation:
          hitTeastResult.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );
    arCoreController.addArCoreNodeWithAnchor(imageItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: whenArCoreViewCreated, //function
        enableTapRecognizer: true, //tap listener on screen
      ),
    );
  }
}
