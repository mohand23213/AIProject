import 'dart:collection';

class MissionariesAndCannibals{
  void findSolutonByDFS(){
    final runTime=Stopwatch();
    runTime.start();
    List discoverd=[];
    myStack stack=myStack();
    CurrentState state=CurrentState(3, 3, true);
    stack.push(state);
    while(!stack.isEmpty()){
      state=stack.pop();
      if(state.isGoal()){
        runTime.stop();
        print(runTime.elapsedMicroseconds);
        break;
      }
      if(state.isValid()){
        for(int i=0;i<state.Children().length;i++){
          if(!discoverd.contains(state.Children()[i]) && !stack.contains(state.Children()[i])){
            stack.push(state.Children()[i]);
          }
        }
      }
    }
  }
}
class myStack{
  Queue queue=Queue();
  CurrentState pop(){
    return queue.removeFirst();
  }
  void push(CurrentState state){
    queue.addFirst(state);
  }
  bool isEmpty(){
    return queue.isEmpty;
  }
  bool contains(CurrentState state){
    return queue.contains(state);
  }
}
class CurrentState{
  int human=3;
  int monster=3;
  bool boatAtRight=true;
  CurrentState(int human,int monster,bool boat){
    this.human=human;
    this.monster=monster;
    this.boatAtRight=boat;
  }
  bool isGoal(){
    return human==0 && monster==0;
  }
  bool isValid(){
    return human>=monster;
  }
  List<CurrentState> Children(){
    List<CurrentState> list=[];
    if(monster>=1)
      list.add(CurrentState(human, monster-1, !boatAtRight));
    if(monster>=2)
      list.add(CurrentState(human, monster-2, !boatAtRight));
    if(human>=1)
      list.add(CurrentState(human-1, monster, !boatAtRight));
    if(monster>=2)
      list.add(CurrentState(human-2, monster, !boatAtRight));
    if(monster>=1 && human>=1)
      list.add(CurrentState(human-1, monster-1, !boatAtRight));
    return list;
  }
}