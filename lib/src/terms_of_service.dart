import 'package:flutter/material.dart';
import 'package:terms_sample/src/terms/terms1.dart';
import 'package:terms_sample/src/terms/terms2.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  int index = 0;

  Widget _topMenu() {
    return Wrap(
      children: [
        _menuOne(
          menu: '이용약관',
          isActive: index == 0,
          onTap: () {
            index = 0;
            update();
          },
        ),
        _menuOne(
            menu: '개인정보 처리방침',
            isActive: index == 1,
            onTap: () {
              index = 1;
              update();
            }),
        _menuOne(
            menu: '개인정보 제3자 제공동의',
            isActive: index == 2,
            onTap: () {
              index = 2;
              update();
            }),
        _menuOne(
            menu: '위치기반 서비스 이용약관',
            isActive: index == 3,
            onTap: () {
              index = 3;
              update();
            }),
        _menuOne(
            menu: '요기패스 이용약관',
            isActive: index == 4,
            onTap: () {
              index = 4;
              update();
            }),
        _menuOne(
            menu: '전자금융거래 이용약관',
            isActive: index == 5,
            onTap: () {
              index = 5;
              update();
            }),
      ],
    );
  }

  void update() => setState(() {});

  Widget _menuOne(
      {required String menu,
      required bool isActive,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 12,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color:
                  isActive ? const Color(0xffe53154) : const Color(0xffcccccc)),
          color: const Color(0xfffafafa),
        ),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
              color: isActive ? const Color(0xffe53154) : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomContentView() {
    return IndexedStack(
      index: index,
      children: [
        const Terms1Widget(),
        const Terms2Widget(),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('서비스 약관'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(10), child: _topMenu()),
            Padding(
                padding: const EdgeInsets.all(10), child: _bottomContentView()),
          ],
        ),
      ),
    );
  }
}
