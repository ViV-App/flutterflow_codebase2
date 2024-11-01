import '/flutter_flow/flutter_flow_util.dart';
import '/pages/questionario/create_object/create_object_widget.dart';
import 'package:flutter/material.dart';
import 'create_objects_model.dart';
export 'create_objects_model.dart';

class CreateObjectsWidget extends StatefulWidget {
  const CreateObjectsWidget({
    super.key,
    this.objects,
    this.field01,
    this.field02,
  });

  final List<dynamic>? objects;
  final String? field01;
  final String? field02;

  @override
  State<CreateObjectsWidget> createState() => _CreateObjectsWidgetState();
}

class _CreateObjectsWidgetState extends State<CreateObjectsWidget> {
  late CreateObjectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateObjectsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              final jsn = widget.objects?.toList() ?? [];

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(jsn.length, (jsnIndex) {
                  final jsnItem = jsn[jsnIndex];
                  return CreateObjectWidget(
                    key: Key('Keyqcn_${jsnIndex}_of_${jsn.length}'),
                    callbck: () async {},
                  );
                }).divide(const SizedBox(height: 24.0)),
              );
            },
          ),
        ],
      ),
    );
  }
}
