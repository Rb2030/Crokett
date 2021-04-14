import 'package:crokett/core/global/value_objects/unique_id.dart';
import 'package:equatable/equatable.dart';

abstract class IEntity implements Equatable { // Not sure if Equatable is needed, may need to delete
  UniqueId get id;
}