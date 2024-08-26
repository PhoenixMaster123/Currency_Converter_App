import 'package:flutter/cupertino.dart';

// ToDo -> here the design can be better (need improvment)


// short cut -> stfl
class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPage();
}

class _CurrencyConverterCupertinoPage extends State<CurrencyConverterCupertinoPage> {

double result = 0;
final TextEditingController textEditingController = TextEditingController();


void convert()
{
   result = double.parse(textEditingController.text) * 0.90;
   setState(() {});
}

  @override
  Widget build(BuildContext context) 
  {
     return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3, //Color.fromARGB(0, 0, 0, 1), // Better -> Colors
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text('Currency Converter'),
        ),
        child: Center( //ColoredBox(color: Color.fromRGBO(255, 0, 0, 1), 
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(  // from top to bottom -> List<Widget>
          mainAxisAlignment: MainAxisAlignment.center, // .start (top) | .end (bottom)
                 // crossAxisAlignment: CrossAxisAlignment.end, // .start (left) | .end (right)
            children: [
              Text(
                "Euro: ${result!=0 ? result.toStringAsFixed(3) : result.toStringAsFixed(2)}", style: const TextStyle(
                fontSize: 55, // default size -> 14
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white
                ),
               ), 
              CupertinoTextField( // take user input
              controller: textEditingController,
                style: const TextStyle( // -> is related the text in the textfield
                  color: CupertinoColors.black
               ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
                ), 
                placeholder: 'Please enter the amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                  keyboardType: const TextInputType.numberWithOptions( // the keybord shows only numbers | numberWithOptions we can add more options
                  decimal: true,
                  ), 
                ),
          
              const SizedBox(height: 10),
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              ),
              ],
            ),
        ), 
        ),  
      );  
  }
}