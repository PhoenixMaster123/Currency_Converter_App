import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget
{
  //const CurrencyConverterMaterialPage({super.key});
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
  /*State<CurrencyConverterMaterialPage> createState() 
  {
    print("create State");
    return _CurrencyConverterMaterialPageState();
  }
  */

}

class _CurrencyConverterMaterialPageState extends State<CurrencyConverterMaterialPage> // State is abstract class
{
 // late double result;
 double result = 0;
final TextEditingController textEditingController = TextEditingController(); // gives us an access to text in the entire Widget
  /*@override
  void initState() { // this method will be called exactly ones for each State (streams are assigned here)
    super.initState();
  }
  */
void convert()
{
   setState(() { // tells that this Wedget need to be rebuilded
                  result = double.parse(textEditingController.text) * 0.90;
                });
}

@override
  void dispose() { // -> not anymore existing no information leaking
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) //BuildContext -> tells us the location of particular Widget and Widget tree
  {
     final border = OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                    style: BorderStyle.solid,
                    //strokeAlign: BorderSide.strokeAlignCenter, // inside (inside borderSide)
                    ),
                    borderRadius:  BorderRadius.circular(5)// BorderRadius.all(Radius.circular(60),
                    );

     return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromARGB(0, 0, 0, 1), // Better -> Colors
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Currency Converter', style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
        body: Center( //ColoredBox(color: Color.fromRGBO(255, 0, 0, 1), 
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
                color: Colors.white
                ),
               ), 
              TextField( // take user input
              controller: textEditingController,
                style: const TextStyle( // -> is related the text in the textfield
                  color: Colors.black
               ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(
                  color: Colors.black
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),  
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions( // the keybord shows only numbers | numberWithOptions we can add more options
                  decimal: true,
                  ), 
                ),
          
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () 
              {
                convert();
                /*setState(() { // tells that this Wedget need to be rebuilded
                  result = double.parse(textEditingController.text) * 0.90;
                });
                */
               /* if(kDebugMode) // if we are in debug mode
                {
                   print('button clicked');
                }
                */
              }, 
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Convert'), // child need to be last => prefferences 
              ),
              ],
            ),
        ), 
        ),  
      );  
  }
}

/*class CurrencyConverterMaterialPagee extends StatelessWidget
{
  const CurrencyConverterMaterialPagee({super.key});

  @override
  Widget build(BuildContext context) //BuildContext -> tells us the location of particular Widget and Widget tree
  {                                  // We use BuildContext when we navigatiate from one to another page on changing the theme
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
     final border = OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                    style: BorderStyle.solid,
                    //strokeAlign: BorderSide.strokeAlignCenter, // inside (inside borderSide)
                    ),
                    borderRadius:  BorderRadius.circular(5)// BorderRadius.all(Radius.circular(60),
                    );

     return Scaffold(
      backgroundColor: Colors.blueGrey, //Color.fromARGB(0, 0, 0, 1), // Better -> Colors
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Currency Converter', style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
        body: Center( //ColoredBox(color: Color.fromRGBO(255, 0, 0, 1), 
        child:  Column(  // from top to bottom -> List<Widget>
        mainAxisAlignment: MainAxisAlignment.center, // .start (top) | .end (bottom)
       // crossAxisAlignment: CrossAxisAlignment.end, // .start (left) | .end (right)
          children: [
            Text(result.toString(), style: const TextStyle(
              fontSize: 55, // default size -> 14
              fontWeight: FontWeight.bold,
              color: Colors.white
              ),
             ), 
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField( // take user input
              controller: textEditingController,
                style: const TextStyle( // -> is related the text in the textfield
                  color: Colors.black
               ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(
                  color: Colors.black
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),  
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions( // the keybord shows only numbers | numberWithOptions we can add more options
                  decimal: true,
              
                  ), 
                //labelText: 'Please enter the amount in USD'
                //label: Text("Please enter the amount in USD", style: TextStyle(
                //  color: Colors.white),
                ),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(onPressed: () 
              {
                result = double.parse(textEditingController.text) * 81;
                build(context);
               /* if(kDebugMode) // if we are in debug mode
                {
                   print('button clicked');
                }
                */
              }, 
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Convert'), // child need to be last => prefferences 
              ),
            ),
            ],
          ), 
        ),  
      );  
      
  }
}
*/

// Column:
// MainAxisAlignment (enum)->  vertical line
// CrossAxisAlignment -> horizontal line

// Row:
// MainAxisAlignment -> horizontal line
// CrossAxisAlignment -> vertical line

// Remove Widget:
// If I want to remove a Widget, I need to make right click -> Refactor -> Remove this Widget

// Color:
// fromRGBO -> red, green, blue, opacity
// fromARGB -> alpha, red, green, blue
// Color (0xAARRGGBB) -> alphaValue, redValue, greenValue, blueValue

// TextStyle:
// fontSize -> scale
// FontWeight.bold -> make the text bold (bold = w700) (normal = w400)

// TextField: Take user input

// Decorations:
// label -> require a Widget (more customize options)
// labelText -> require a String
// floatingLabelStyle -> how the label should look like, when is floating
// helperText -> now the label is below
// hintText -> the text is not floating anymore and when I start to type disappear

// Prefix:
// prefixText (String) -> shows before the actual text and don't disappear when we start typing
// prefixIcon -> placed exactly the icon

// Suffix:
// suffixIcon -> will placed it at end

// Border:
// borderSide: BorderSide()


// BorderRadius: make it more circle
// .zero -> eliminates the entire border radius
// .all -> all directions
// .horizontal -> only from the left and right side (we need to mention it) | Example: left: Radius.circular(60)
// .vertical -> only from top and bottom side  (we need to mention it top and bottom)
// .circular -> everything looks circular
// .lerp -> interpolate between two objects

// padding -> amount of space by which to insert the child (inside the container)
// margin -> outside the container
// container -> take the same size as fontSize by default (it is make from many widgets)

// EdgeInsets:
// .all 
// .fromLTRB -> I need to put to everyone (left: top: right: buttom: ) I cannot skip
// .only -> only one
// .symmetric (vertical: , horizontal: )

// Buttons:
// EllevatedButton -> give 3d effect (shadow, have the same properties as textButton)
// textButton -> appears like a text

// Buttons size
// icon size
// fixed size -> screen size

// Print:
// print -> requires Object
//debugPrint -> requires only String

// Modes:
// debug -> testing the application
// release -> how the app will look like in production (we are not going to see the errors)
// profile -> mixture of debug and release mode

// How to run in other modes
// Terminal -> flutter run --release or --profile

