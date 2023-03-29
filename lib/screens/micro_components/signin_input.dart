import 'package:chopwell_rider_application/constants/constants.dart';
import 'package:flutter/material.dart';

class SignInput extends StatelessWidget {
  SignInput(this.icon, this.label, this.hint, {required this.controller});

  IconData icon;
  String label;
  String hint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: KConstants.baseFourRedColor,
      ),
      child: TextField(
        style: TextStyle(
          fontFamily: "Questrial",
          color: KConstants.baseRedColor,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: KConstants.baseTwoRedColor,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            icon,
            color: KConstants.baseRedColor,
          ),
          labelStyle: TextStyle(
            fontFamily: "Montserrat",
            color: KConstants.baseRedColor,
            fontSize: 15.0,
            // fontWeight: FontWeight.bold,
          ),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
