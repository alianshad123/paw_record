import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paw_record/model/AssignedUserModel.dart';
import 'package:paw_record/ui/detailviews/detailview_screen.dart';

class PetDetailScreen extends StatefulWidget {
  const PetDetailScreen({Key? key}) : super(key: key);

  @override
  _PetDetailScreenState createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {


  bool isCreateListBtnShowing = true;
  bool isCreateListShowing = false;
  bool valuefirst = false;
  bool valueSecond = false;
  bool valueThird = false;
  bool valueForth = false;
  bool valueFifth = false;
  bool valueSixth = false;
  bool valueSeventh = false;
  bool valueEighth = false;
  bool valueNineth = false;
  bool valueTenth = false;


  void showCheckList() {
    setState(() {
      isCreateListShowing = true;
      isCreateListBtnShowing = false;
    });
  }

  List<AssignedUserModel> assignedUsers = [
    AssignedUserModel(
      "images/ic_avatar.png", "Mohan",),
    AssignedUserModel(
      "images/ic_avatar.png", "Anubam",),
    AssignedUserModel(
        "images/ic_avatar.png", "John"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("",
              style: TextStyle(
                color: Colors.black,
              )),
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage("images/ic_back_btn.png"),
              size: 20,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              onPressed: () {


              },
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 420,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/detail_image.png"),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                          top: 370,
                          right: 10,
                          child: Container(
                            child: Card(
                                elevation: 10,
                                child: Container(
                                    height: 40,
                                    width: 150,
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: CircleAvatar(
                                              backgroundImage:
                                              NetworkImage(
                                                  "https://picsum.photos/200/300?random=1"),
                                              radius: 10.0,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              'Ali Anshad',
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .none,
                                                  color: Color(0xFF8017DA),
                                                  fontWeight: FontWeight
                                                      .normal,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              'Pet owner',
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .none,
                                                  fontWeight: FontWeight
                                                      .normal,
                                                  fontSize: 8),
                                            )
                                          ],

                                        ),
                                        SizedBox(width: 20,),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.message,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],

                                    )
                                )

                            ),
                          )
                      )
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Troy',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Color(0xFF070707),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('AGE',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFF999696),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Text('4 months',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SIZE',
                                        style: TextStyle(
                                            color: Color(0xFF999696),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Text('small',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SEX',
                                        style: TextStyle(
                                            color: Color(0xFF999696),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    Text('Female',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('LOCATION',
                                      style: TextStyle(color: Color(0xFF999696),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        'Vasanth Nagar, Bengaluru, Karnataka 560052',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('SERVICE TYPE',
                                      style: TextStyle(color: Color(0xFF999696),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Dog Walking',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('DETAILS',
                                      style: TextStyle(color: Color(0xFF999696),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        'Troy is lovely and and well trained dog.She loves to pull a litle bit when she sees other dogs',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: isCreateListBtnShowing,

                        /* child: TextButton(
                    child: const Text(
                      '+ Create list',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.fromLTRB(50, 10, 50, 10)),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF8017DA)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: const Color(0xFF8017DA))))),
                    onPressed: () {

                     showCheckList();
                     */ /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailViewScreen()),
                      );*/ /*
                    },
                  ),*/
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text(
                                  '+ Create list',
                                  style: TextStyle(fontSize: 18,
                                      color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsets>(
                                        EdgeInsets.fromLTRB(
                                            50, 10, 50, 10)),
                                    backgroundColor: MaterialStateProperty
                                        .all<Color>(
                                        Color(0xFF8017DA)),
                                    shape:
                                    MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(20.0),
                                            side: BorderSide(
                                                color: const Color(
                                                    0xFF8017DA))))),
                                onPressed: () {
                                  showCheckList();
                                },
                              )),
                        ),


                      ),
                      Visibility(
                          maintainSize: false,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: isCreateListShowing,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "personal to-do's",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Color(0xFF070707),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  child: Text(
                                    'assigned to',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 10),
                                  ),
                                ),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valuefirst,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valuefirst = value!;
                                            });
                                          },
                                        ),
                                        Text('how you handled it. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueSecond,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueSecond = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Scheduled a zoom call with  pets team. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueThird,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueThird = value!;
                                            });
                                          },
                                        ),
                                        Text('Push latest photo. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueForth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueForth = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Do you have any pet specific training. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueFifth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueFifth = value!;
                                            });
                                          },
                                        ),
                                        Text('Will they meet your dog first ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueSixth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueSixth = value!;
                                            });
                                          },
                                        ),
                                        Text('how you handled it. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueSeventh,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueSeventh = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Scheduled a zoom call with  pets team. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueEighth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueEighth = value!;
                                            });
                                          },
                                        ),
                                        Text('Push latest photo. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueNineth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueNineth = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Do you have any pet specific training. ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Color(0xFF8017DA),
                                          activeColor: Color(0xFFC3C2C4),
                                          value: this.valueTenth,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              this.valueTenth = value!;
                                            });
                                          },
                                        ),
                                        Text('Will they meet your dog first ',
                                          style: TextStyle(fontSize: 17.0),),

                                      ],
                                    ),

                                    SizedBox(height: 10),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<
                                                    EdgeInsets>(
                                                    EdgeInsets.fromLTRB(
                                                        50, 10, 50, 10)),
                                                backgroundColor: MaterialStateProperty
                                                    .all<Color>(
                                                    Color(0xFF8017DA)),
                                                shape:
                                                MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(20.0),
                                                        side: BorderSide(
                                                            color: const Color(
                                                                0xFF8017DA))))),
                                            onPressed: () {


                                            },
                                          )),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                )

                              ],

                            ),

                          )
                      )
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )));
  }
}


class AssignedUserView extends StatelessWidget {
  AssignedUserModel usersData;

  AssignedUserView(this.usersData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PetDetailScreen()),
          );*/
        },

        child: Card(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
            Container(
            width: 20,
            height: 20,
            child: Container(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage:
                NetworkImage(
                    "https://picsum.photos/200/300?random=1"),
                radius: 10.0,
              ),
            ),
          ),
              SizedBox(width: 5,),
              Text(
                usersData.name,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )

          ]
          )
          ,
        ));

    /* child: Container(
          height: 200,
          width: double.infinity,
          margin:
          EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(dogsData.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Column(
                  children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              dogsData.name,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        dogsData.time,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.pets,
                            color: Color(0xFFFFFFFF),
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            dogsData.actvty,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ));*/
  }
}