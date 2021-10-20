import 'package:flutter/material.dart';

class AddCustomerWidget extends StatelessWidget {
  final Function onTap;
  AddCustomerWidget({this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.person_add_alt,
                  size: 28,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Add Customer",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }}