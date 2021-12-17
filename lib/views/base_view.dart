import 'package:flutter/material.dart';
import 'package:fireweb/service_locator.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseView<T extends Model> extends StatefulWidget {
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T)? onModelReady;

  const BaseView({Key? key, builder, this.onModelReady})
      : _builder = builder,
        super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Model> extends State<BaseView<T>> {
  final T _model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(_model);
    }    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: _model,
        child: ScopedModelDescendant<T>(
            child: Container(color: Colors.red), builder: widget._builder));
  }
}
