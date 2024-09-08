class Castle{
  int value;
  int row=1;
  int col=2;
  List path=[];
  Castle(this.value,this.row,this.col);

  void setR(int val){
    row = val;
  }
  void setC(int val){
    col = val;
  }

  @override
  String toString() {
    return '${[value, row,col]}';
  }
}