import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

showErrorDialog(BuildContext context, String message) { 
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 300,
            height: 90,
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(
                    FontAwesomeIcons.triangleExclamation,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
