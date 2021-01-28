import 'package:flutter/material.dart';

class FormveTextFormField extends StatefulWidget {

  @override
  _FormveTextFormFieldState createState() => _FormveTextFormFieldState();
}

class _FormveTextFormFieldState extends State<FormveTextFormField> {

  String _adSoyad, _sifre, _emailAdres;
  final formKey = GlobalKey<FormState>();
  bool otomatikKontrol = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.green,
        hintColor: Colors.indigo,
        errorColor: Colors.lightBlue,
        primaryColor: Colors.teal,
      ),
    child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save,
        ),
      ),
      appBar: AppBar(
        title: Text("Form ve TextFormField"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          autovalidate: otomatikKontrol,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Adınız ve Soyadınız",
                  labelText: "Ad Soyad",
                  border: OutlineInputBorder(),
                ),
                validator: (String girilenVeri){
                  if(girilenVeri.length<6){
                    return "lütfen adınızı soyadınızı tam girin";
                  }else return null;
                },
                onSaved: (deger) => _adSoyad = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email adresiniz",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ))),
                validator: (String girilenVeri){
                  if(! girilenVeri.contains("@")){
                    return "Geçersiz email";
                  }else return null;
                },
                onSaved: (deger) => _emailAdres = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Şifre girin",
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ))),
                validator: (String girilenVeri){
                  if(girilenVeri.length < 6){
                    return "En az 6 karakter gerekli";
                  }else return null;
                },
                onSaved: (deger) => _sifre = deger,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton.icon(
                onPressed: () {
                  _girisBilgileriniOnayla;
                },
                icon: Icon(Icons.save),
                label: Text("KAYDET"),
                color: Colors.blueAccent,
                disabledColor: Colors.amber,
              )
            ],
          ),
        )
      ),
    )
    );
  }
  void _girisBilgileriniOnayla(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("Girilen mail: $_emailAdres şifre : $_sifre adsoyad : $_adSoyad");
    }else{
      setState(() {
        otomatikKontrol= true;
      });
    }

  }
}
