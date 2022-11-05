import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  final String name,description,image,phone,email,address,rating;

  DescriptionScreen({required this.name, required this.description,
    required this.image, required this.phone, required this.email, required this.address, required this.rating,});

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff4D7482),Color(0xFF87F9BB)],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:30, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image(image: AssetImage(
                  widget.image
              ),),
            ),
            Container(
              child: Text(
                'Dr. '+widget.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
            Container(
              child: Text(
                'Psychatrist',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 15
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "About Doctor",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:Color(0xFF2f2f51)
                            ),
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.only(top: 5, left: 28,right: 25),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Dr Puneet Dwevedi is one of the best Psychiatrist in Gurgaon with the experience of 17 years in this field. Dr. Puneet Dwevedi is a Consultant Psychiatrist and the Head of the Department of Mental Health and Behavioural Sciences, Fortis Healthcare. Dr. Puneet Dwevedi has done his MBBS from UCMS, Delhi and his MD Psychiatry from Lady Hardinge Medical College, Delhi.',
                        style: TextStyle(
                        ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 30),
                        Text(
                          "Rating:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:Color(0xFF2f2f51)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.rating+'⭐'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "Address:",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:Color(0xFF2f2f51)
                            ),
                          ),
                        ]),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.address),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "Contact:",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:Color(0xFF2f2f51)
                            ),
                          ),
                        ]),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email: '+widget.email+' \nPhone: '+widget.phone),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
