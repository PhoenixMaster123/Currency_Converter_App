import 'package:currency/currency_converter_cupertino_page.dart';
import 'package:currency/currency_converter_material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() 
{
  // Widget -> building blocks of the user interface (How UI should look like) 
  //Example the Demo App(Header, button, middle section, Text) Can be any UI component

  runApp(const MyApp()); // run the app 
  // const -> this constructor is complile time constant (that means myApp doesn't need to be recreated every single time)
}

// Types of Widget:
// 1. StatelessWidget -> state/data is immutable, when the widget is created, it cannot be changed
// 2. StatefulWidget  -> state changes (example -> from the demo app the zero will not change if we click the button)
// 3. InheritedWidget

// State -> data that will determine how the widget should look like | some data that the widget will care about

// Design Types:
// 1. Material Design (Google) -> navigation
// 2. Cupertino Design (Apple)

// create custom Widget (component)
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override 
  Widget build (BuildContext context)
  {
    //const Text('Hello, World', textDirection: TextDirection.rtl);
    return const MaterialApp(
      home: CurrencyConverterMaterialPage()
      );
  }
}

// Apple -> Cupertino App
class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage()
      );
  }
}