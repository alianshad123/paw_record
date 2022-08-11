
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Help",
              style: TextStyle(
                color: Colors.black,
              )),
          brightness: Brightness.light,
          backgroundColor: const Color(0xFFFAFAFA),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
          /*actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Color(0xFF8017DA),
              ),
              onPressed: () {},
            )
          ],*/
        ),
        body:Container(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text(

                    "Lorem ipsum dolor sit amet. A accusamus amet est repellat ratione ad soluta illo. Id reprehenderit facere ad officia expedita non autem consequatur non similique dolore est quod eligendi eos dignissimos reprehenderit ab. Ut quos molestiae et esse vero ex autem magni qui rerum consequatur nisi voluptas et dicta quisquam ex nihil veritatis. Aut quia ullam aut voluptas laboriosam sed debitis nostrum a possimus labore."

    "Sit dolores distinctio 33 consequuntur doloribus non reprehenderit quisquam nam corporis voluptatem in fuga molestiae et fugit ipsa? Ex neque libero ut dolorem dolorem aut accusantium molestias est ullam sunt et quas qui expedita libero vel distinctio earum."

    "Et dolor architecto nam reprehenderit dolor qui tempore laudantium. Qui veniam explicabo est omnis fuga est illo ipsam qui amet quia.")
            )
        )
    );
  }
}