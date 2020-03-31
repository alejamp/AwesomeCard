import 'package:flutter/material.dart';

class CardFrontLayout {
  String bankName;
  String cardNumber;
  String cardExpiry;
  String cardHolderName;
  Widget cardTypeIcon;
  double cardWidth;
  double cardHeight;
  Color textColor;
  bool compactView;
  bool narrowView;

  CardFrontLayout(
      {this.bankName = "",
      this.cardNumber = "",
      this.cardExpiry = "",
      this.cardHolderName = "",
      this.cardTypeIcon,
      this.cardWidth = 0,
      this.cardHeight = 0,
      this.compactView = false,
      this.textColor}) {
        this.narrowView = (this.compactView && cardWidth < 320.0);
      }

  Widget layout1() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                ],
              ),
              Expanded(
                child: ClipRect(
                  child: AnimatedOpacity(
                    opacity: !compactView ? 1.0 : 0.0,
                    duration: compactView ? Duration(milliseconds: 100) : Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Exp. Date",
                                      style: TextStyle(
                                          package: 'awesome_card',
                                          color: textColor,
                                          fontFamily: "SourceCodePro",
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      cardExpiry == null || cardExpiry.isEmpty
                                          ? "MM/YY"
                                          : cardExpiry,
                                      style: TextStyle(
                                          package: 'awesome_card',
                                          color: textColor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "SourceCodePro",
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  cardHolderName == null || cardHolderName.isEmpty
                                      ? "Card Holder"
                                      : cardHolderName,
                                  style: TextStyle(
                                      package: 'awesome_card',
                                      color: textColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "SourceCodePro",
                                      fontSize: 17),
                                ),

                              ],
                            ),
                            // cardTypeIcon
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0,right: 12.0),
            child: AnimatedOpacity(
              opacity: !compactView ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
                // visible: !compactView,
                child: new Image.asset(
                  'images/contactless_icon.png',
                  fit: BoxFit.fitHeight,
                  width: 30.0,
                  height: 30.0,
                  color: textColor,
                  package: 'awesome_card',
                ),
              ),
          ),
        ),


        AnimatedPositioned (
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutQuad,
          left: compactView ? 80.0 : 18.0,
          top: compactView ? 18.0 : cardHeight - 115.0,
          child: 
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: TextStyle(
                          package: 'awesome_card',
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: "SourceCodePro",
                          fontSize: compactView ? 15.0: 22.0
                        ),
                      child: Text(
                        cardNumber == null || cardNumber.isEmpty
                        ? 'XXXX XXXX XXXX XXXX'
                        : cardNumber,
                      ),
                    ),
        ),

        Align(
          alignment: Alignment.topLeft,
          child: AnimatedOpacity(
            opacity: !narrowView ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),

            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18.0),
              child: Container(
                // height: 25,
                child: Text(
                  bankName,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),        

        AnimatedPositioned (
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutQuad,
          bottom: 0.0,
          right: this.narrowView ? this.cardWidth - 70.0: 5.0,
          // left: this.narrowView ? 10.0 : null,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: cardTypeIcon,
          )
          )
      ],
    );
  }
}
