import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.onCancel,
    required this.onAccept,
  });

  final String title;
  final VoidCallback onCancel;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(25),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text Alert
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Row of button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Button Cancel
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: onCancel,
                  child: Text("Cancel"),
                ),
                SizedBox(
                  width: 10,
                ),

                // Button Accept
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    backgroundColor: WidgetStatePropertyAll(blueColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: onAccept,
                  child: Text("yes, I'm sure", style: TextStyle(),),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
