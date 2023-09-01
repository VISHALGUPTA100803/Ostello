import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        SvgPicture.asset('assets/images/Vector (1).svg'),
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
                      SvgPicture.asset('assets/images/Group 1410101508.svg'),
                      const SizedBox(
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
                      color:
                          const Color(0xFF7D23E0), // Setting the color property
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.40, color: Color(0x777D23E0)),
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
    );
  }
}
