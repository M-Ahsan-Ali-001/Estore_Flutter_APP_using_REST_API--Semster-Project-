class Cart {

  List<String> arr=[];
  List<int> no=[];
  List<String> arr2=[];
  List<String> sst_id=[];




  String v='';
  String rem='';
  String pr='';
  String del_pr='';
  String tostrg='';
  String stid='';
  String r_stid='';
  int non=0;
  int total=0;

  //Cart(String varr)
  //{
    //v=varr;
   // ad();
  //}
  void empty()
  {
    arr.clear();
    no.clear();
    arr2.clear();
     v='';
     rem='';
     pr='';
     del_pr='';
     tostrg='';
     non=0;
     total=0;
  }


  void ad()
  {
    arr.add(v);
    arr2.add(pr);
    non=int.parse(pr);
    sst_id.add(stid);
    no.add(non);
        print(arr);
        print(arr2);
        print(sst_id);
  }
  void add_no()
  {
    non=int.parse(pr);
    no.add(non);
    arr2.add(pr);
  }
void  tost()
{
  tostrg=arr.join(" ");


}

void delete()
{
  arr.remove(rem);
  arr2.remove(del_pr);
  no.remove(int.parse(del_pr));
  sst_id.remove(r_stid);
}
int tottal()
{
  int len=no.length;
  int i=0;
  int tt=0;
   while(i<len)
    {
      tt=tt+no[i];
      print(no[i]);
      i++;


    }
    return tt;

}



}