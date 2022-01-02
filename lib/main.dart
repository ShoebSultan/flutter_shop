import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/app_theme.dart';
import 'package:flutter_shop/UI/views/product_list_view.dart';
import 'package:flutter_shop/helpers/dependency_assembly.dart';

void main() {
  setupDependencyAssembler();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.data,
      home: Scaffold(
        body: ProductListView(),
      ),
    );
  }
}
