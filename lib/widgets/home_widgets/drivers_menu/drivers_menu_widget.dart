import 'package:flutter/material.dart';

class DriversMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.cloud_download_outlined,
              size: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Icon(
                Icons.add_box_outlined,
                size: 28,
              ),
            ),
            Icon(
              Icons.qr_code_scanner_sharp,
              size: 28,
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Icons.more_vert,
              size: 28,
            )
          ],
        ));
  }
}
