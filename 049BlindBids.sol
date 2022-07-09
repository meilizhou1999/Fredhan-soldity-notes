//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;
contract SimpleAuction {
    //Parameters of the auction.Times are either
    //absolute unix timestamps(seconds since 1970-01-01)
    //or time periods in seconds
    //拍卖的参数是绝对的时间戳，或者以秒为单位的时间段

    address payable public beneficiary;  //最终拍卖受益人的地址，是可以payable的
    uint public auctionEndTime;

    //Current state of the auction  当前拍卖的状态
    address public highestBidder;   //出价最高的人的地址
    uint public highestBid;   //拍卖最高的出价的价格

    //Allowed withdrawals of previous bids;  允许用户对之前的报价进行取回
    mapping(address => uint) pendingReturns;

    //Set to true at the ends,disallows any change.  在结尾出设置为真，不允许任何改变，对于一个bool值来说，默认初始时为false
    //By default initialized to 'false'
    bool ended;

    //Events that will be emitted on changes  对于任何状态改变的时候，会排放的事件
    event HighestBidIncreased(address bidder,uint amount);
    event AuctionEnded(address winner,uint amount);


   //Errors that describe failures.  描述交易失败的错误。
   
   //The triple-slash comments are so-called natspec comments. 这种前面有三根斜杠的评论叫做natspec评论
   //They will be shown when the user 他们会出现在用户被要求确认某笔交易时，或者是出现了一个错误时
   //is asked to confirm a transaction or 
   //when a error is displayed


   ///The auction has already ended.   提示该拍卖已经结束
   error AuctionAlreadyEnded();
   ///There is already a highed or equal bid.  已经有一个相同或者更高的报价
   error BidNotHighEnough(uint highestBid);
   ///The auction has not ended yet. 拍卖尚未结束
   error AuctionNotYetEnded();
   ///The function auctionEnd has already been called.  auctionEnd这个函数已经被调用过了
   error AuctionEndAlreadyCalled();


   ///Create a simple auction with 'bidding Time' 创建一个简单的拍卖函数,带有设定的总竞拍时间（以秒为计数），同时有受益人的地址
   ///seconds bidding time on behalf of the
   ///beneficary address 'beneficiaryAddress'
   constructor(uint biddingTime,address payable beneficiaryAddress){
       beneficiary = beneficiaryAddress;
       auctionEndTime = block.timestamp + biddingTime;
   }

   ///Bid on the auction with the value sent
   ///together with this transaction  对这个拍卖进行出价，相当于一笔交易
   ///The value will only be refunded if the 所说的价值可以被退回，如果你不是最终的拍卖获胜者的话
   ///auction is not won.

   function bid() external payable{
       //No arguments are necessary,all information is already part of 不需要传参数，所有的信息都是交易的一部分，函数里需要有payable这个关键字
       //the transaction.The keyword payable is required for the function这样这个函数才能接收Eth;
       //to be receive ether

       //Revert the call if the bidding period is over; 如何拍卖时间结束，直接将这个函数调用反转
    if(block.timestamp > auctionEndTime) revert AuctionAlreadyEnded();

      //if the bid is not higher,send the 如果出价没有高于最高价，将所有钱退回去
      //money back(the revert statement will revert all changes in this function execution including it having received the money).
    if(msg.value <= highestBid) revert BidNotHighEnough(highestBid);  

    if (highestBid != 0){
        //Sending Back the money by simply using highestBidder.send(highestBid) is a security risk.
        //because it could execute an untrusted contract
        //It is always safer to let the recipients withdraw their money themselves
        pendingReturns[highestBidder] += highestBid;
        }
    highestBidder = msg.sender;
    highestBid = msg.value;
    emit HighestBidIncreased(msg.sender,msg.value);
    }
 ///withdraw a bid that is overbid.

 function withdraw() external returns(bool) {
     uint amount = pendingReturns[msg.sender];
     if (amount > 0){
         //It is important to set this to zero because the recipient
         //can call this function again as part of the receiveing call
         //before 'send' returns.
      pendingReturns[msg.sender] = 0;

      if(!payable(msg.sender).send(amount))  {
          //No need to call throw here,just reset the amount owing
          pendingReturns[msg.sender] = amount;
          return false;
      }  
     }
     return true;    
     }
///End the auction and send the highest bid
///to the beneficiary
function auctionEnd() external{
    //It is a good guideline to structure functions that interact
    //with other contracts(i.e. they call funcitons or send Ether)
    //into three phases:
    //1.checking conditions
    //2.performing actions(potentially changing conditions)
    //3.interacting with other contracts
    //if these phases are mixed up,the other contract could call
    //back into the current contract and modify the state or cause
    //effects(ether payout)to be performed multiple times.
    //If functions called internally include interaction with external
    //contracts,the also have to be considered interaction with
    //external contracts


    //1.conditions
    if(block.timestamp < auctionEndTime) revert AuctionNotYetEnded;
    if (ended) revert AuctionAlreadyCalled; 

    //2.Effects
    ended = true;
    emit AuctionEnded(highestBidder,highestBid);

    //3.Interaction
    beneficiary.tranfer(highestBid);
}
 
   


}
