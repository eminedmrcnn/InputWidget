import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TarihSaatOrnek extends StatefulWidget {
  @override
  _TarihSaatOrnekState createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek> {

  @override
  Widget build(BuildContext context) {

    DateTime suan = DateTime.now();
    DateTime ucAyOncesi = DateTime(2021, suan.month-3);
    DateTime yirmiGunSonrasi = DateTime(2021, suan.day+20);

    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Data time picker"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(onPressed: (){
              showDatePicker(context: context, initialDate: suan, firstDate: ucAyOncesi, lastDate: yirmiGunSonrasi)
              .then((secilenTarih) {
                debugPrint(secilenTarih.toString());
                print(formatDate(secilenTarih, [dd,'-',mm,'-',yyyy]));
              });
            },
              child: Text("Tarih Seç"),
              color: Colors.green,
            ),
            RaisedButton(onPressed: (){
              showTimePicker(context: context, initialTime: suankiSaat).then((secileSaat) {
                debugPrint(secileSaat.format(context));
              });
            },
              child: Text("Saat seç"),
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
