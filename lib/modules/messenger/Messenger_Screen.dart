import 'package:flutter/material.dart';

class Messenger_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage('https://images.hindustantimes.com/img/2022/11/20/550x309/Fh8-GrTWQAMEno8_1668910522750_1668910539398_1668910539398.jpg'),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            'Chats',
            style: TextStyle(
              fontSize: 20.0,
            ),
          )

        ],
      ),
        actions: [
          IconButton(onPressed:(){} , icon:CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          ),
          IconButton(onPressed:(){} , icon:CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10.0,),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height:130 ,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                   itemBuilder:(context,index) =>buildStoryItem(),
                  separatorBuilder: (context,index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 20,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index) =>buildChatItem(),
                  separatorBuilder:(context,index) => SizedBox(
                    height: 20.0,
                  ) ,
                  itemCount:40 ,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment:AlignmentDirectional.bottomEnd ,
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage('https://images.hindustantimes.com/img/2022/11/20/550x309/Fh8-GrTWQAMEno8_1668910522750_1668910539398_1668910539398.jpg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 5.0,
              end: 5.0,
            ),
            child: CircleAvatar(
              radius: 9.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed Ramadan gjdfsdvdvvfdgdvxcvcxgd fvfdb fbcbdgdvjfgkfdvnkjfdghflxkvjfdjkfdhfdkjhgfdvhkdfljflvjrgfdhghdfkghrgkfhgkrghfdjghruvhdfjkghfdjkvhfdjkghfdjkhvjkfdghfjkdhjkghfjk',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hello my name is Ahmed Ramadan dfhvrktjhfkjvhfdkhkhvfjkdgnfkjvhfdukghjkvhfjvhfjkvhjkvhfdkjghrhdfjghrjfjhfkjdvhjkdfghdfkjhgkrjghfduvhrjvfdkj',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,
                  ),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                    '05:00 pm'
                ),

              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem() =>  Container(
    width:80.0 ,
    child: Column(
      children: [
        Stack(
          alignment:AlignmentDirectional.bottomEnd ,
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage('https://images.hindustantimes.com/img/2022/11/20/550x309/Fh8-GrTWQAMEno8_1668910522750_1668910539398_1668910539398.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 5.0,
                end: 5.0,
              ),
              child: CircleAvatar(
                radius: 9.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Ahmed Ramadan dhcbsdmcb hfdhg',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    ),
  );
}
