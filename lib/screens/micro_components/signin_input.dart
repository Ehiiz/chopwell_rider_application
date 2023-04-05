import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter/material.dart';


class SignInput extends StatefulWidget {
  SignInput(this.icon, this.label, this.errorMessage, this.hint,
      {required this.controller, required this.regExp});

  IconData icon;
  String label;
  String hint;
  TextEditingController controller;
  RegExp regExp;
  String errorMessage;

  @override
  _SignInputState createState() => _SignInputState();
}

class _SignInputState extends State<SignInput> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (!widget.regExp.hasMatch(value)) {
          setState(() {
            _isValid = false;
          });
        } else {
          setState(() {
            _isValid = true;
          });
        }
      },
      style: TextStyle(
        fontFamily: "Questrial",
        color: KConstants.baseRedColor,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: KConstants.baseFourRedColor,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: KConstants.baseRedColor,
          ),
          labelStyle: TextStyle(
            fontFamily: "Montserrat",
            color: KConstants.baseThreeRedColor,
            fontSize: 15.0,
            // fontWeight: FontWeight.bold,
          ),
          labelText: widget.label,
          hintText: widget.hint,
          errorText: !_isValid ? widget.errorMessage : null,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
          errorStyle: TextStyle(
            color: KConstants.baseTwoRedColor,
            fontSize: 13,
          )),
    );
  }
}

