import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  T getModel<T extends Model>(BuildContext context) {
    // return ScopedModel.of(context, rebuildOnChange: true);
    // return ScopedModel.of(context, rebuildOnChange: true);
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }
}
