import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TimestampAdapter extends TypeAdapter<Timestamp> {
  @override
  final typeId = 4; 

  @override
  Timestamp read(BinaryReader reader) {
    return Timestamp.fromMillisecondsSinceEpoch(reader.readInt());
  }

  @override
  void write(BinaryWriter writer, Timestamp timestamp) {
    writer.writeInt(timestamp.millisecondsSinceEpoch);
  }
}
