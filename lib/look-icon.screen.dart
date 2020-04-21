import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:ico_number/widget.factory.dart';



class LookIconScreen extends StatefulWidget {

  static const _divider = Divider();

  @override
  _LookIconScreenState createState() => _LookIconScreenState();

}

class _LookIconScreenState extends State<LookIconScreen> {

  final _listFrom = TextEditingController(text: '0');

  _LookIconScreenState() {
    _listFrom.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) =>
    WidgetFactory.getScaffold(
      child: ListView.builder(
        itemBuilder: (builder, index) {
          switch (index) {
            case 0:
              return WidgetFactory.getPadding(
                child: Column(
                  children: <Widget>[
                    I18nText('look-icon.description', child: Text('', textAlign: TextAlign.justify)),
                    LookIconScreen._divider,
                    _ListFromInput(
                      context: context,
                      controller: _listFrom,
                    ),
                  ],
                )
              );
            default:
              return ListTile(
                title: Text('${ index + (double.tryParse(_listFrom.text)?.toInt() ?? 0) - 1 }'),
              );
          }
        }
      ),
      title: FlutterI18n.translate(context, 'screen.title.look-icon'),
    );

}

class _ListFromInput extends StatelessWidget {

  static final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller;

  _ListFromInput({Key key, @required TextEditingController controller, BuildContext context }):
    _controller = controller,
    super(key: key) {
      _controller.addListener(() =>
        _formKey.currentState.validate()
      );
  }


  @override
  Widget build(BuildContext context) =>
    Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        validator: (value) {
          String error;

          if (null == double.tryParse(value)?.toInt())
            error = FlutterI18n.translate(context, 'look-icon.validation.invalid-list-from');

          return error;
        },
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          hintText: FlutterI18n.translate(context, 'look-icon.list-from'),
        ),
      ),
    );



}
