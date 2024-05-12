import 'package:flutter/material.dart';

class EmptyAddressSearch extends StatelessWidget {
  const EmptyAddressSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No addresses found.'),
    );
  }
}