import 'package:flutter/material.dart';

class AddressList extends StatelessWidget {
  final List<String> addresses;

  const AddressList(this.addresses, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(addresses[index]),
        );
      },
    );
  }
}