import '/flutter_flow/flutter_flow_util.dart';
import 'custom_time_picker_widget.dart' show CustomTimePickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomTimePickerModel extends FlutterFlowModel<CustomTimePickerWidget> {
  ///  Local state fields for this component.

  List<int> hoursT = [0, 1, 2, 3, 4];
  void addToHoursT(int item) => hoursT.add(item);
  void removeFromHoursT(int item) => hoursT.remove(item);
  void removeAtIndexFromHoursT(int index) => hoursT.removeAt(index);
  void insertAtIndexInHoursT(int index, int item) => hoursT.insert(index, item);
  void updateHoursTAtIndex(int index, Function(int) updateFn) =>
      hoursT[index] = updateFn(hoursT[index]);

  bool swtc = false;

  int initHour = 0;

  int initMin = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
