import '/flutter_flow/flutter_flow_util.dart';
import 'custom_date_picker_widget.dart' show CustomDatePickerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomDatePickerModel extends FlutterFlowModel<CustomDatePickerWidget> {
  ///  Local state fields for this component.

  List<int> hoursT = [0, 1, 2, 3, 4];
  void addToHoursT(int item) => hoursT.add(item);
  void removeFromHoursT(int item) => hoursT.remove(item);
  void removeAtIndexFromHoursT(int index) => hoursT.removeAt(index);
  void insertAtIndexInHoursT(int index, int item) => hoursT.insert(index, item);
  void updateHoursTAtIndex(int index, Function(int) updateFn) =>
      hoursT[index] = updateFn(hoursT[index]);

  bool swtc = false;

  int initDay = 0;

  int initMonth = 0;

  DateTime? initDate;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CarouselD widget.
  CarouselSliderController? carouselDController;
  int carouselDCurrentIndex = 1;

  // State field(s) for CarouselM widget.
  CarouselSliderController? carouselMController;
  int carouselMCurrentIndex = 1;

  // State field(s) for CarouselA widget.
  CarouselSliderController? carouselAController;
  int carouselACurrentIndex = 74;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
