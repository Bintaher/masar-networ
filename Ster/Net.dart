import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(StarNetApp());
}

class StarNetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Net',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StarNetHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StarNetHomePage extends StatelessWidget {
  final String whatsappNumber = "+967780483098";

  void _openWhatsApp() async {
    final whatsappUrl = "https://wa.me/\$whatsappNumber";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("Could not open WhatsApp");
    }
  }

  void _measureSpeed() {
    print("Measure Speed Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Net'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Spacer(),
            Icon(Icons.network_check, size: 120, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              'مرحبًا بك في Star Net',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: _measureSpeed,
              icon: Icon(Icons.speed),
              label: Text('قياس سرعة الإنترنت'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _openWhatsApp,
              icon: Icon(Icons.support_agent),
              label: Text('خدمة العملاء (واتساب)'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'عروض الباقات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  packageCard('200 ريال', '800 ميجا'),
                  packageCard('500 ريال', '2 جيجا'),
                  packageCard('1000 ريال', '5 جيجا'),
                  packageCard('5000 ريال', '30 جيجا'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget packageCard(String price, String data) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.wifi, color: Colors.blueAccent),
        title: Text(data, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('السعر: \$price'),
        trailing: ElevatedButton(
          onPressed: () {
            print('اشتراك في باقة \$price');
          },
          child: Text('اشتراك'),
        ),
      ),
    );
  }
}
