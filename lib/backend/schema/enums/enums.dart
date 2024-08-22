import 'package:collection/collection.dart';

enum EstadoCIvil {
  Solteiro,
  aa,
}

enum ToastTypes {
  red,
  yellow,
  puprle,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (EstadoCIvil):
      return EstadoCIvil.values.deserialize(value) as T?;
    case (ToastTypes):
      return ToastTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}