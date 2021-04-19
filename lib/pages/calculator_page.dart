import 'package:calculator_floor/controllers/calculator_controller.dart';
import 'package:calculator_floor/core/constants.dart';
import 'package:calculator_floor/widgets/clear_button.dart';
import 'package:calculator_floor/widgets/number_input_field.dart';
import 'package:calculator_floor/widgets/primary_button.dart';
import 'package:calculator_floor/pages/result_dialog.dart';
import 'package:calculator_floor/widgets/text_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: _buildForm(),
          )),
    );
  }

  Widget _buildForm() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeader(label: kEnviromentHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setRoomWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setRoomLength,
          ),
          SizedBox(height: kBigSpace),
          TextHeader(label: kFloorHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setFloorWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setFloorLength,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: 'Preço em reais',
            onSaved: _controller.setFinalResult,
          ),
          SizedBox(height: kBigSpace),
          PrimaryButton(
            label: kCalculateButton,
            onPressed: _onCalculate,
          ),
          SizedBox(height: kSpace),
          ClearButton(
            label: kClearFields,
            onPressed: _onClearFields,
          ),
        ],
      ),
    );
  }

  void _onClearFields() {
    _formKey.currentState.reset();
  }

  void _onCalculate() {
    //Calcular
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }
}
