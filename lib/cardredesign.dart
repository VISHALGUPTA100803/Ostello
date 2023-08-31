import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CardRedesign extends StatefulWidget {
  const CardRedesign({super.key});

  @override
  State<CardRedesign> createState() => _CardRedesignState();
}

class _CardRedesignState extends State<CardRedesign> {
  String? selectedSortOption = 'Relevance'; // To track the selected option

  void showSortOptions(BuildContext context, Offset position) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy,
          overlay.size.width - position.dx, overlay.size.height - position.dy),
      items: [
        _buildPopupMenuItem("Relevance"),
        _buildPopupMenuItem("Distance"),
        _buildPopupMenuItem("Price"),
        _buildPopupMenuItem("Rating"),
      ],
    );

    if (result != null && result != selectedSortOption) {
      setState(() {
        selectedSortOption = result;
      });
    }
  }

  PopupMenuItem<String> _buildPopupMenuItem(String text) {
    bool isSelected = selectedSortOption == text;

    return PopupMenuItem<String>(
      value: text,
      child: Row(
        children: [
          // Displaying a circle always. If the item is selected, the circle is purple
          Icon(Icons.circle,
              color: isSelected ? Colors.purple : Colors.grey, size: 12),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const CircleAvatar(
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'For JEE-Mains',
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              width: double.infinity,
              height: 44,
              child: TextField(
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for UPSC Coaching',
                  contentPadding:
                    const  EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFBDBDBD),
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.mic, color: Colors.purple),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Filters',
                        style: TextStyle(
                          color: Color(0xFF7D23E0),
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.21,
                          letterSpacing: 0.14,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        (Icons.menu_open),
                        color: Colors.purple,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text(
                        'Sort',
                        style: TextStyle(
                          color: Color(0xFF7D23E0),
                          fontSize: 14,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.21,
                          letterSpacing: 0.14,
                        ),
                      ),
                     const SizedBox(
                        width: 28,
                      ),
                      InkWell(
                        onTap: () {
                          final RenderBox renderBox =
                              context.findRenderObject() as RenderBox;
                          final position = renderBox.localToGlobal(Offset.zero);
                          showSortOptions(context, position);
                        },
                        child: const Icon(
                          (Icons.arrow_downward),
                          color: Colors.purple,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ),
               const SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7D23E0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '<2Km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.21,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                ),
               const SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  width: 79,
                  height: 29,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFF7D23E0)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'JEE',
                      style: TextStyle(
                        color: Color(0xFF7D23E0),
                        fontSize: 14,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.21,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              width: 338,
              height: 175,
              decoration: ShapeDecoration(
                color: Color(0xFFF6EFFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 157,
                            height: 149,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Color(0xE57D23E0)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset('assets/images/coaching.jpeg'),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/Vector (1).svg'),
                               const SizedBox(
                                  width: 4,
                                ),
                               const Text(
                                  'Kalkaji , New Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                     const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const SizedBox(
                            width: 135,
                            child: Text(
                              'Metro Coaching Center',
                              style: TextStyle(
                                color: Color(0xFF272727),
                                fontSize: 18,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w700,
                                height: 1.06,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                         const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Group 1410101508.svg'),
                            const  SizedBox(
                                width: 4,
                              ),
                             const Text(
                                '4.3',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF414141),
                                  shape: OvalBorder(),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                             const Text(
                                '3 kms away',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'PYHSICS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'MATHS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 86,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'CHEMISTRY',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 45,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'JEE ',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 65,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              // Using BoxDecoration instead of ShapeDecoration
                              color: const Color(
                                  0xFF7D23E0), // Setting the color property
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 0.40, color: Color(0x777D23E0)),
                            ),
                            child: const Text(
                              '20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w600,
                                height: 1.70,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                 const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        width: 3,
                        height: 3,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF414141),
                          shape: OvalBorder(),
                        ),
                      ),
                     const SizedBox(
                        width: 4,
                      ),
                     const Text(
                        '2 of your school students study here',
                        style: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 12,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.42,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              width: 338,
              height: 175,
              decoration: ShapeDecoration(
                color: Color(0xFFF6EFFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 157,
                            height: 149,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Color(0xE57D23E0)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset('assets/images/coaching.jpeg'),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/Vector (1).svg'),
                              const  SizedBox(
                                  width: 4,
                                ),
                              const  Text(
                                  'Kalkaji , New Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const  SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const  SizedBox(
                            width: 135,
                            child: Text(
                              'Metro Coaching Center',
                              style: TextStyle(
                                color: Color(0xFF272727),
                                fontSize: 18,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w700,
                                height: 1.06,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                        const  SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Group 1410101508.svg'),
                            const  SizedBox(
                                width: 4,
                              ),
                            const  Text(
                                '4.3',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            const  SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF414141),
                                  shape: OvalBorder(),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                            const  Text(
                                '3 kms away',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'PYHSICS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'MATHS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 86,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'CHEMISTRY',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 45,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'JEE ',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 65,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              // Using BoxDecoration instead of ShapeDecoration
                              color: const Color(
                                  0xFF7D23E0), // Setting the color property
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 0.40, color: Color(0x777D23E0)),
                            ),
                            child: const Text(
                              '20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w600,
                                height: 1.70,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              width: 338,
              height: 175,
              decoration: ShapeDecoration(
                color: Color(0xFFF6EFFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 157,
                            height: 149,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Color(0xE57D23E0)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset('assets/images/coaching.jpeg'),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/Vector (1).svg'),
                               const SizedBox(
                                  width: 4,
                                ),
                               const Text(
                                  'Kalkaji , New Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                     const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const SizedBox(
                            width: 135,
                            child: Text(
                              'Metro Coaching Center',
                              style: TextStyle(
                                color: Color(0xFF272727),
                                fontSize: 18,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w700,
                                height: 1.06,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                         const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Group 1410101508.svg'),
                            const  SizedBox(
                                width: 4,
                              ),
                            const  Text(
                                '4.3',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF414141),
                                  shape: OvalBorder(),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                             const Text(
                                '3 kms away',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'PYHSICS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'MATHS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const  SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 86,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'CHEMISTRY',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 45,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'JEE ',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                         const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 65,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              // Using BoxDecoration instead of ShapeDecoration
                              color: const Color(
                                  0xFF7D23E0), // Setting the color property
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 0.40, color: Color(0x777D23E0)),
                            ),
                            child: const Text(
                              '20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w600,
                                height: 1.70,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                 const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        width: 3,
                        height: 3,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF414141),
                          shape: OvalBorder(),
                        ),
                      ),
                     const SizedBox(
                        width: 4,
                      ),
                     const Text(
                        '2 of your school students study here',
                        style: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 12,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.42,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              width: 338,
              height: 175,
              decoration: ShapeDecoration(
                color: Color(0xFFF6EFFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 157,
                            height: 149,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Color(0xE57D23E0)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset('assets/images/coaching.jpeg'),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/Vector (1).svg'),
                              const  SizedBox(
                                  width: 4,
                                ),
                               const Text(
                                  'Kalkaji , New Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    const  SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 135,
                            child: Text(
                              'Metro Coaching Center',
                              style: TextStyle(
                                color: Color(0xFF272727),
                                fontSize: 18,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w700,
                                height: 1.06,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Group 1410101508.svg'),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.3',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF414141),
                                  shape: OvalBorder(),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '3 kms away',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'PYHSICS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'MATHS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 86,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'CHEMISTRY',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 45,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'JEE ',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 65,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              // Using BoxDecoration instead of ShapeDecoration
                              color: Color(
                                  0xFF7D23E0), // Setting the color property
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 0.40, color: Color(0x777D23E0)),
                            ),
                            child: Text(
                              '20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w600,
                                height: 1.70,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/2.png',
                      width: 79, height: 82, fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 156,
                  child: Text(
                    'Having a tough time navigating through your career roadmap?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Avenir Next LT Pro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 88,
                  height: 25,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7D23E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Ask Ostello',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Avenir Next LT Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              width: 338,
              height: 175,
              decoration: ShapeDecoration(
                color: Color(0xFFF6EFFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 157,
                            height: 149,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Color(0xE57D23E0)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Image.asset('assets/images/coaching.jpeg'),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/Vector (1).svg'),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Kalkaji , New Delhi',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 135,
                            child: Text(
                              'Metro Coaching Center',
                              style: TextStyle(
                                color: Color(0xFF272727),
                                fontSize: 18,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w700,
                                height: 1.06,
                                letterSpacing: 0.16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/Group 1410101508.svg'),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '4.3',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF414141),
                                  shape: OvalBorder(),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '3 kms away',
                                style: TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontFamily: 'Avenir Next LT Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 1.42,
                                  letterSpacing: 0.12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'PYHSICS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 69,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'MATHS',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 86,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 8, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'CHEMISTRY',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 45,
                                height: 19,
                                padding: const EdgeInsets.only(
                                    top: 5, left: 10, right: 10, bottom: 4),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.40, color: Color(0x777D23E0)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'JEE ',
                                  style: TextStyle(
                                    color: Color(0xFF7D23E0),
                                    fontSize: 10,
                                    fontFamily: 'Avenir Next LT Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                    letterSpacing: 1.20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 65,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              // Using BoxDecoration instead of ShapeDecoration
                              color: Color(
                                  0xFF7D23E0), // Setting the color property
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 0.40, color: Color(0x777D23E0)),
                            ),
                            child: Text(
                              '20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Avenir Next LT Pro',
                                fontWeight: FontWeight.w600,
                                height: 1.70,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                 const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        width: 3,
                        height: 3,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF414141),
                          shape: OvalBorder(),
                        ),
                      ),
                     const SizedBox(
                        width: 4,
                      ),
                     const Text(
                        '2 of your school students study here',
                        style: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 12,
                          fontFamily: 'Avenir Next LT Pro',
                          fontWeight: FontWeight.w400,
                          height: 1.42,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
