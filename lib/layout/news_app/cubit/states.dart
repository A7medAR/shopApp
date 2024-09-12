abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class NewsBottomNavStates extends NewsStates{}

class NewsBusinessSuccessStates extends NewsStates{}

class NewsBusinessErrorStates extends NewsStates
{

 String error;

 NewsBusinessErrorStates(this.error);

}

class NewsSportsSuccessStates extends NewsStates{}


class NewsSportsErrorStates extends NewsStates
{

 String error;

 NewsSportsErrorStates(this.error);

}

class NewsScienceSuccessStates extends NewsStates{}

class NewsScienceErrorStates extends NewsStates
{

 String error;

 NewsScienceErrorStates(this.error);

}

class NewsSearchSuccessStates extends NewsStates{}

class NewsSearchErrorStates extends NewsStates
{

 String error;

 NewsSearchErrorStates(this.error);

}