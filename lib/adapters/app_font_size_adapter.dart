import 'package:hive/hive.dart';
import 'package:notium/common/constants.dart';

class AppFontSizeAdapter extends TypeAdapter<AppFontSize> {
  @override
  final int typeId = 2;

  @override
  AppFontSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppFontSize.small;
      case 1:
        return AppFontSize.medium;
      case 2:
        return AppFontSize.large;
      default:
        return AppFontSize.medium;
    }
  }

  @override
  void write(BinaryWriter writer, AppFontSize obj) {
    switch (obj) {
      case AppFontSize.small:
        writer.writeByte(0);
        break;
      case AppFontSize.medium:
        writer.writeByte(1);
        break;
      case AppFontSize.large:
        writer.writeByte(2);
        break;
    }
  }
}
