import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/Screens/Home/body.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    "Tarım Bakanlığı",
    "Tübitak Hakkındda Detaylı Bilgi",
    "Toprak ve hava durumu",
    "Sanayi Ve Teknoloji Bakanlığı",
    "Türkiye’nin İthal Ettiği Tarım Ürünleri",
    "Türkiyede Kırsal Alan Yönetimi Nedir?"
  ];

  var descList = [
    "Bitki yetiştiriciliği hakkında bilgi almak için tıklayınız",
    "Tübitak araştırma kurumuyla ilgili bilgi almak için tıklayınız",
    "mmlik yağış durumları ve 14 günlük hava durumu ",
    "Sanayi ve teknoloji bakanlığının resmi sitesi",
    "Türkiyede en çok ithal edilen tarım ürünleri ",
    "Kırsal alan yönetimi ile ilgili bilgilendirici pdfelere ulaşın"
  ];

  var imgList = [
    "assets/images/kuru.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg"
  ];

  var LinkList = [
    "https://www.tarimorman.gov.tr/",
    "https://www.tubitak.gov.tr/",
    "https://www.meteoblue.com/tr/hava/14-gun/eski-toprak_t%c3%bcrkiye_7582775",
    "https://www.sanayi.gov.tr/anasayfa",
    "https://www.tkteknoloji.com.tr/medya-merkezi/blog/turkiye-nin-en-cok-ithal-ettigi-tarim-urunleri/",
    "https://acikders.ankara.edu.tr/course/view.php?id=5744"
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      backgroundColor: Color.fromARGB(59, 59, 59, 59),
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              launchURL1(LinkList[index]);
            },
            child: Card(
              child: SizedBox(
                width: 100,
                height: 70,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(imgList[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            titleList[index],
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: width,
                            child: Text(
                              descList[index],
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

launchURL1(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
