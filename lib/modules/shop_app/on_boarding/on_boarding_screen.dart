import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/shared/components/components.dart';
import '../../../models/user/user_model.dart';
import '../../../shared/network/local/cahce_helper.dart';
import '../login/shop_login.dart';


class OnBoardingScreen extends StatelessWidget {


List<BoardingModel> boarding =[
  BoardingModel(
    body:'On board 1 body',
    title: 'On board 1 title',
    image: 'images/shop_1.jpg'
  ),
  BoardingModel(
      body:'On board 2 body',
      title: 'On board 2 title',
      image: 'images/shop_1.jpg'
  ),
  BoardingModel(
      body:'On board 3 body',
      title: 'On board 3 title',
      image: 'images/shop_1.jpg'
  ),
];
var boardController=PageController();
bool isLast=false;
void submit(context) {
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value) { navigatorToAndFinish(context, ShopLoginScreen());});

}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:(){
            submit(context);
          }
            , child: Text('SKIP'),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children:
            [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index){
                    if(index==boarding.length-1)
                      {
                        isLast=true;
                      }
                  },
                  controller: boardController,
                  itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  physics:BouncingScrollPhysics() ,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(controller: boardController, count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                  ),
                  Spacer(),
                  FloatingActionButton(onPressed: (){
                    if(isLast)
                    {
                      submit(context);
                    }
                    else{
                    boardController.nextPage(duration: Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);}

                  },
                  child: Icon(Icons.arrow_forward_ios),)
                ],
              ),
            ]

        ),
      )
      
    );

  }
  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ), 
      Text(
        '${model.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
    ],
  );
}
