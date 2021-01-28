import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  @override
  _DigerFormElemanlariState createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String secilenRenk = "Kırmızı";
  List<String> sehirler = ["Ankara","İstanbul","Sakarya", "Bursa"];
  String secilenSehir  = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: Text("Diğer Form Elemanları"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi;
                });
              },
              activeColor: Colors.red,
              title: Text("Checkbox title"),
              subtitle: Text("Subtitle checkbox"),
              secondary: Icon(Icons.add),
              selected: true,
            ),
            RadioListTile<String>(
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: Text("Ankara"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map_sharp),
            ),
            RadioListTile<String>(
              value: "Bursa",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: Text("Bursa"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map_sharp),
            ),
            RadioListTile<String>(
              value: "İzmir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen değer : $deger");
                });
              },
              title: Text("İzmir"),
              subtitle: Text("Radio Subtitle"),
              secondary: Icon(Icons.map_sharp),
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                  debugPrint("Anlaşma onaylandı: $deger");
                });
              },
              title: Text("Switch Title"),
              subtitle: Text("Switch subtitle"),
              secondary: Icon(Icons.refresh),
            ),
            Text("Değeri sliderden seçiniz: "),
            Slider(
              value: sliderDeger,
              onChanged: (yeniDeger) {
                setState(() {
                  sliderDeger = yeniDeger;
                });
              },
              min: 10,
              max: 20,
              divisions: 20,
              label: sliderDeger.toString(),
            ),
            DropdownButton<String>(items: [
              DropdownMenuItem<String>(
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text("Kırmızı"),
                  ],
                ),
                value: "Kırmızı",
              ),
              DropdownMenuItem<String>(
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.blue,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text("Mavi"),
                  ],
                ),
                value: "MAvi",
              ),DropdownMenuItem<String>(
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.green,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text("Yeşil"),
                  ],
                ),
                value: "Yeşil",
              ),
            ], onChanged: (secilen) {
              setState(() {
                secilenRenk = secilen;
                debugPrint("SEçilen renk : $secilen");
              });
            },
              hint: Text("Seçiniz"),
              value: secilenRenk,
            ),
            DropdownButton(items: sehirler.map((oankiSehir){
              return DropdownMenuItem<String>(child: Text(
                oankiSehir
              ),
                value: oankiSehir,
              );
            }).toList(), onChanged:(s){
              setState(() {
                secilenSehir=s;
              });
            },
              value: secilenSehir,
            )
          ],
        ),
      ),
    );
  }
}
