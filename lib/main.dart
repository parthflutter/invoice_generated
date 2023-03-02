import 'package:flutter/material.dart';
import 'package:invoice_generated/second.dart';

import 'invoice.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => home(),
      'second':(context) => Billgenret(),
    },
  ),
  );
}
