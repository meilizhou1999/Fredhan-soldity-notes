//SPDX-License-Identifier:MIT
pragma solidity >0.6.0 <0.9.0;

contract boolean{
    bool public _a;
 
    uint num1 = 70*79;

    uint num2 = 78*71;


    function getbool() public view returns(bool){
        return  !_a;
    }

    
    function bijiao() public view returns(bool){
        //这个结果是false  num1小于num2;
        return  num1 > num2;
    }

    function bijiao2() public view returns(bool){
        //这个结果是true  num1小于num2;
        return  num1 < num2;
    }

      function bijiao3() public view returns(bool){
        //这个结果是true  num1小于num2;
        return  num1 == num2;
    }
  //&&是与
    function yu()  public view returns(bool){
        return(bijiao2() && true);
    }

    function yu2()  public view returns(bool){
        return(bijiao2() && false);
    }
//||是或
     function huo()  public view returns(bool){
        return(bijiao2() || false);
    }

      function huo2()  public view returns(bool){
        return(bijiao2() || true);
    }

    function huo3()  public view returns(bool){
        return(bijiao() || false);
    }

    

//&& 是与 || 是或
//true && true = true

//ture && false = false
//true || false = true
//false || false = false
//false || false = false 


}
