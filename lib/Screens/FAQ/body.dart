import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soil_npk_app/NavBar.dart';
import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:soil_npk_app/Screens/ProScreen/proScreen.dart';
import 'package:soil_npk_app/components/proSqButton.dart';

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageState> {
  String _Faq1Q = "";
  String _Faq1A = "Günümüzde dördüncü tarım devrimi, tarımda dijitalleşme, internetin tarım endüstrisine etkisi ve büyük verinin işlenmesi gibi konular sıkça tartışılmaya başlandı. Bu tartışmalarda, “tarımda yeni bir devrim yapma ihtiyacı neden bu kadar önemlidir” ve “gerçekten bu kadar teknolojik gelişmeye ihtiyaç var mıdır” şeklindeki sorular ağırlık kazandı. Tarımda teknolojinin kullanılmasındaki amaç çok basittir; değişen şartlarla mücadele etmek, doğanın zorlu koşullarıyla başa çıkabilmek ve daha fazla verim alabilmek için teknolojiden yararlanmak "
      "Bu açıdan günümüze kadar gelen süreci özetlemek gerekirse, tarım teknolojisi kavramı  karasaban ın MÖ 3000 yılında Mezopotamya ve Hindistan’da kullanılmasıyla başlamıştır. İkinci Dünya savaşında azalan tarım arazilerinde verimi artırmak için traktörler hayvan gücünün yerini almış ve tarımın teknolojik gelişimine katkıda bulunmuştur. Karasaban hala dünyanın bazı bölgelerinde kullanılır olsa da, ABD, Hollanda, Almanya, Fransa, Japonya, İngiltere, Çin, İsrail ve İspanya gibi gelişmiş ülkelerde yeni teknolojik gelişmeler eşliğinde tarım faaliyetleri hız kesmeden devam etmektedir.Dünyada ve ülkemizde farkındalığı giderek artan ve yakın gelecekte bizi bekleyen nüfus ve talep artışı, küresel ısınma gibi kritik konuların 2030 yılından itibaren günlük yaşamımızı nasıl değiştireceğini, bu konuda yapılan zirve ve raporlardan öğrenmekteyiz. Buna göre, tarım ve teknoloji konusunda yapılacak tüm faaliyetler gündelik yaşamımızda sanayi ve hizmet sektörüne göre çok daha fazla hissedilecektir.Gelişmiş ülkelerin tarıma farklı bir vizyonla bakmaya başlamasıyla, tarım stratejik bir alan olarak belirlenmiş ve bugüne kadar sanayi ve endüstriye yapılan yatırımlar, tarıma da aktarılmaya başlanmıştır. Artan nüfusu beslemek, küresel ısınmada kaybedilen tarım arazileri gibi çok acil konular nedeniyle dünyanın ve ülkemizin en önemli gündemi tarım ve teknoloji olmaya başlamıştır. Bu açıdan ülkelerdeki tarlalar yeni teknoloji üsleri olmaya aday olmuştur.Tarım alanları insan hayatına 1.dereceden etkisi olan yerlerdir. Bu açıdan tarım teknolojileri kavramı da birçok konuyu kapsamaktadır. Akıllı Tarım, Biyoteknoloji, Nanoteknoloji, Dikey/Kentsel Tarım, Atık Yönetimi, Sulama sistemleri ve teknolojileri gibi birçok alt başlığı olan geniş bir alanı içermektedir. Buna göre; tarımda teknolojiyi takip etmek ve kullanmak bir lüks olmaktan çıkmış ve mecburiyet haline gelmiştir.";
  String _Faq2Q = "";
  String _Faq2A = "Ekilen ürün türlerine göre farklı zararlıları adet olarak sayıp, risk eşik değerinde size uyarı göndererek doğru ilaçlama zamanını bildirir. Dahili solar panel ve kamera sistemi ile kablosuz haberleşme sistemlerine sahiptir.";
  String _Faq3Q = "";
  String _Faq3A = "Ürünlerin düzenli gelişim takibini uzaktan yapabilirsiniz.Gübre etkisi, Çap ve yaprak gelişimi algoritma sayesinde ölçümlenerek raporlanır.";
  String _Faq4Q = "";
  String _Faq4A = "Kuyu, nehir, göl ve tank seviyelerinin ve derinliklerin 3mm hassasiyetle ölçümünü sağlamaktadır. İstasyonlarına bağlanabilen, kesin ölçümlü ve uygun maliyetli paslanmaz çelik dalgıç su seviyesi sensörüdür.";
  String _Faq5Q = "";
  String _Faq5A = "Topraklı ve topraksız seralardan dolayı sera istasyonuna ek olarak satılan hizmetlerdendir. Toprak nem ve sıcaklık ölçümlemesini de sera istasyonu verilerine dahil ederek sulama önerilerini de sisteme eklenmesini sağlar.";

  _MyHomePageState() {
    getFAQ1().then((val) => setState(() {
          _Faq1Q = val;
        }));

    getFAQ2().then((val2) => setState(() {
          _Faq1A = val2;
        }));
    getFAQ21().then((val3) => setState(() {
          _Faq2Q = val3;
        }));

    getFAQ22().then((val4) => setState(() {
          _Faq2A = val4;
        }));

    getFAQ31().then((val3) => setState(() {
          _Faq3Q = val3;
        }));

    getFAQ32().then((val4) => setState(() {
          _Faq3A = val4;
        }));

    getFAQ41().then((val3) => setState(() {
          _Faq4Q = val3;
        }));

    getFAQ42().then((val4) => setState(() {
          _Faq4A = val4;
        }));

    getFAQ51().then((val3) => setState(() {
          _Faq5Q = val3;
        }));

    getFAQ52().then((val4) => setState(() {
          _Faq5A = val4;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Tarım ve Teknoloji Nedir? " + _Faq1Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq1A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq1A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Feromon Kamerası-Tuzağı Nedir?" + _Faq2Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq2A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq2A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Fenoloji Kamerası Nedir? " + _Faq3Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq3A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq3A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Tank Seviyesi Sensörü Nedir?" +
                                  _Faq4Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq4A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq4A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Toprak Nemi Sensörü Nedir? " + _Faq5Q,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )),
                        collapsed: Text(
                          _Faq5A,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            for (var _ in Iterable.generate(1))
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _Faq5A,
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<String> getFAQ1() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I establish the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq1Q = doc["Question"];
        _Faq1A = doc["Answer"];
      });
    });
    return await _Faq1Q;
  }

  Future<String> getFAQ2() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I establish the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq1Q = doc["Question"];
        _Faq1A = doc["Answer"];
      });
    });
    return await _Faq1A;
  }

  Future<String> getFAQ21() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I use the mobile app?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq2Q = doc["Question"];
        _Faq2A = doc["Answer"];
      });
    });
    return await _Faq2Q;
  }

  Future<String> getFAQ22() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I use the mobile app?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq2Q = doc["Question"];
        _Faq2A = doc["Answer"];
      });
    });
    return await _Faq2A;
  }

  Future<String> getFAQ31() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question',
            isEqualTo: "How affected to the agriculteral industry?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq3Q = doc["Question"];
        _Faq3A = doc["Answer"];
      });
    });
    return await _Faq3Q;
  }

  Future<String> getFAQ32() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question',
            isEqualTo: "How affected to the agriculteral industry?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq3Q = doc["Question"];
        _Faq3A = doc["Answer"];
      });
    });
    return await _Faq3A;
  }

  Future<String> getFAQ41() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "Where can I buy the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq4Q = doc["Question"];
        _Faq4A = doc["Answer"];
      });
    });
    return await _Faq4Q;
  }

  Future<String> getFAQ42() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "Where can I buy the system?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq4Q = doc["Question"];
        _Faq4A = doc["Answer"];
      });
    });
    return await _Faq4A;
  }

  Future<String> getFAQ51() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I contact the Soil Systems?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq5Q = doc["Question"];
        _Faq5A = doc["Answer"];
      });
    });
    return await _Faq5Q;
  }

  Future<String> getFAQ52() async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('FAQ')
        .where('Question', isEqualTo: "How can I contact the Soil Systems?")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["Question"]);
        print(doc["Answer"]);

        _Faq5Q = doc["Question"];
        _Faq5A = doc["Answer"];
      });
    });
    return await _Faq5A;
  }
}
