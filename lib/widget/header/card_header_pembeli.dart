import 'package:flutter/material.dart';
import 'package:growell/color/list_color.dart';

class CardHeaderPembeli extends StatelessWidget {
  const CardHeaderPembeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.17,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: ListColor().baseColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      "Khadafi Rohman Prihanda",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      "Pembeli",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.11,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Icon(
                Icons.shopping_cart_rounded,
                color: ListColor().baseColor,
              ),
            ),
          ],
        )
      ),
    );
  }
}