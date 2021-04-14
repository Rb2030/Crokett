import 'package:crokett/core/global/value_objects/unique_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'i_entity.dart';

abstract class CurrentUser implements IEntity {
  // Changed to CurrentUser to not clash with Firebase user

  factory CurrentUser({required UniqueId id}) {
    return CurrentUser(id: id);
  }
}
