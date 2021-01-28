import 'package:flutter/material.dart';
class InputIslemleri extends StatefulWidget {
  @override
  _InputIslemleriState createState() => _InputIslemleriState();
}

class _InputIslemleriState extends State<InputIslemleri> {

  String girilenMetin = "";
  FocusNode _fNode;
  int maxLine= 1;
  TextEditingController textController1;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "varsayılan");

    _fNode.addListener(() {
      setState(() {
        if(_fNode.hasFocus){
          maxLine = 3;
        }else{
          maxLine = 1;
        }
      });
    });

  }
  @override
  void dispose() {
    _fNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İnput İşlemleri"
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 24,
            height: 24,
            child: FloatingActionButton(onPressed: (){
              FocusScope.of(context).requestFocus(_fNode);
            },
              child: Icon(Icons.edit, size: 12,), backgroundColor: Colors.grey,
            ),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(onPressed: (){
            debugPrint(textController1.text= "butondan geldim");
          },
            child: Icon(Icons.edit,), mini: true, backgroundColor: Colors.pink,
          ),
          SizedBox(height: 10,),
          FloatingActionButton(onPressed: (){
            debugPrint(textController1.text.toString());
          },
            child: Icon(Icons.edit),
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(16,),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: false,
              maxLines: maxLine,
              maxLength: 20,
              focusNode: _fNode,
              controller: textController1,
              decoration: InputDecoration(
                hintText: "metni buraya yazın",
                labelText: "metin",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
                filled: true,
                fillColor: Colors.red.shade50,
              ),
              maxLengthEnforced: true,
              onChanged: (String s)=> debugPrint("On change: $s"),
              onSubmitted: (String s){
                girilenMetin = s;
                debugPrint("onSubmitted : $s");
              },
              cursorColor: Colors.pink,
            ),
          ),
          Padding(padding: EdgeInsets.all(16,),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autofocus: false,
              maxLines: 1,
              maxLength: 20,
              decoration: InputDecoration(
                hintText: "metni buraya yazın",
                labelText: "metin",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.done),
                suffixIcon: Icon(Icons.add),
                filled: true,
                fillColor: Colors.red.shade50,
              ),
              maxLengthEnforced: true,
              onChanged: (String s)=> debugPrint("On change: $s"),
              onSubmitted: (String s){
                girilenMetin = s;
                debugPrint("onSubmitted : $s");
              },
              cursorColor: Colors.pink,
            ),
          ),


          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 200,
            color: Colors.teal.shade400,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  girilenMetin
              ),
            ),
          ),
        ],
      ),
    );
  }
}
