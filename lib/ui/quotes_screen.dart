import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quote_app/utils/constants.dart';

/// Quotes screen
class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenWidgetState createState() => _QuoteScreenWidgetState();
}

/// Quotes screen widget state
class _QuoteScreenWidgetState extends State<QuoteScreen> {
  int currentQuoteIndex = 0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote App'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showQuote(),
            _getNewQuoteButton()
          ],
        ),
      ),
    );
  }

  void _fetchNewQuote() {
    final int randomNumber = random.nextInt(quotes.length);

    if(randomNumber == currentQuoteIndex) {
      _fetchNewQuote();
      return;
    }
    setState(() {
      currentQuoteIndex = randomNumber;
    });
  }

  Container _getNewQuoteButton() {
    return (
      Container (
        margin: EdgeInsets.only(
          top: 50,
          left: 100,
          right: 100
        ),
        height: 40,
        child: RaisedButton(
          color: Color.fromRGBO(29, 63, 28, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          onPressed: _fetchNewQuote,
          child: Row( 
            children: [
              Icon(
                Icons.emoji_objects,
                color: Colors.white,
              ),
              Text('Inspire me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Container _showQuote() {
    return Container (
      height: 200,
      width: 300,
      margin: EdgeInsets.only(
        top: 100
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/quote_board.png'),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(quotes[currentQuoteIndex],
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ]
      ),
    );
  }
}
