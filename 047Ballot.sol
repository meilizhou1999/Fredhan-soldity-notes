// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

///@title 带有委托功能的投票智能合约
contract Ballot{
    //This declares a new complex type which will
    //be used for variables later
    //It will represent a single voter.
    //下面这个结构体创建列一组变量
    //这个结构体待会会被用于代表投票者的属性
    struct Voter {
        uint weight; //定义投票者的投票权重（票数），这个票数是可以累积的,是一个非负整数
        bool voted; //定义一个布尔值，判断这个地址有没有投过票
        address delegate;  //person delegated to 我把投票权委托给了哪个地址
        uint vote; //index of the voted proposal  这个地址最后给几号提案
    }

   

    //下面这个结构体代表一个单一的提案的属性
    struct Proposal{
        bytes32 name;  //提案名 长度为32字节
        uint VoteCount;  //这个提案 看最终获得了多少投票   
    }

    address public chairperson; //定义一个地址 这个地址为投票委员会主席，也就是合约部署者

    //下面我们这个mapping方法是宣告对于某个代表投票者的地址来言
    //储存一个Voter方法,来看他的一些基本投票属性
    mapping(address => Voter) public voters;

    //一个动态数组结构，这个动态数组里的每个元素都是Proposal结构
    Proposal[] public proposals;

    ///选择一个提案名称，建立一次新的投票活动

    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;  //将这次投票的负责主席为当前合约调用者
        voters[chairperson].weight = 1;  //负责这个投票的地址默认也有一个的投票权重

        //For each of the provided proposal name  对于每一个提供的提案名字来说
        //create a new proposal object and add it,建立一个新的proposal对象，然后添加她
        //to the end of the array, 到数组的末端

        for(uint i = 0 ; i<proposalNames.length ; i++) {
            //'Proposal({...})' creates a temporary  
            //Proposal object and 'proposals.push(...)'
            //appends it to the end of 'proposals'
            //向动态长度数组proposals的结尾处通过push方法来添加一个Proposal对象
            //这个Proposal对象的name属性就是你输入的每个proposalNames，然后每个的累积投票数都是0
            proposals.push(Proposal({name:proposalNames[i],VoteCount:0}));
        }
    }

    //Give 'voter' the right to vote on this ballot.
    //May only be called by 'chairperson'
    //下面这个function是用于给voter投票权限
    //这个函数只能被合约部署者，也就是chairperson调用
    function giveRightToVote(address voter) external{
       //If the first argument of 'require' evaluates
       //to 'false',execution terminates and all
       //changes to the state and ether balances
       //are reverted
        // This used to consume all gas in old EVM versions, but
        // not anymore.
        // It is often a good idea to use `require` to check if
        // functions are called correctly.
        // As a second argument, you can also provide an
        // explanation about what went wrong
        
        require(msg.sender == chairperson,"Only chaiperson can give right to vote"); 
        //只有合约部署者才能调用这个函数，给别的地址投票权
        require(!voters[voter].voted,"The voters have already voted");
        //需要这个投票的地址没有投过票，也就是通过mapping方法voters，将外部传入的地址map成一个Voter,然后这个Voter有voted属性
        //如果 voters[voter].voted这个bool值为true,就说明她投票过了就报错
        require(voters[voter].weight == 0,"the voters have already have the weight");
        voters[voter].weight = 1;

    }

    //Delegate your vote to the voter 'to'  将你的投票权委托给'to'这个地址
    function delegate(address to) external {
        //assign reference 匹配选项
        Voter storage sender = voters[msg.sender];   //将这个函数调用的地址mapping成一个Voter
        require(sender.voted == false,"the voter have already voted");//需要调用这个函数的地址没有投过票

        require(to != msg.sender,"Self-delegation is disallowed!");  //委托给的地址不能和调用这个函数的地址相同，不能自己给自己委托

        // Forward the delegation as long as
        // `to` also delegated.
        // In general, such loops are very dangerous,
        // because if they run too long, they might
        // need more gas than is available in a block.
        // In this case, the delegation will not be executed,
        // but in other situations, such loops might
        // cause a contract to get "stuck" completely.
        while (voters[to].delegate!=address(0)) {
            to = voters[to].delegate;
        
       
       //we found a loop in delegation,not allowed
       require(to != msg.sender,"Found loop in delegation");

        }

       //Since 'sender' is a reference,this
       //modifies 'voters[msg.sender].voted
       sender.voted = true;   //既然msg.sender(调用这个函数的地址)已经把投票权给了to这个地址，所以他是投过票的，要把voted这个bool属性改为true
       sender.delegate = to;  //他的委托给的地址就是to这个地址
       Voter storage delegate_ = voters[to];  //建立一个状态为storage的变量delegate_，他的结构是Voter，是将to这个地址通过voters 这个mapping方法
       // map成的一个Voter结构
       if(delegate_.voted){
           //if the delegate already voted,
           //add to her weight
           proposals[delegate_.vote].VoteCount += sender.weight;
             //如果我委托的地址已经投过了，我就跟着他投，delegate_.vote就是to这个地址变成Voter 给几号提案投的票
          }
          else{
           //我委托的这个地址还没投过票，他的投票权重就加上我的投票权重
           delegate_.weight += sender.weight;
       }

    }


    //Give your vote(including votes delegate to you)
    //to proposal 'proposal[Proposal].name'.  把你的票投给哪个提案
 
    function vote(uint proposal) external{
        Voter storage sender = voters[msg.sender];   //建立一个名为sender的指针 就是代表将调用这个函数的地址匹配成一个Voter
        require(sender.weight != 0, "has no right to vote");
        require(!sender.voted,"you have already voted");
        sender.voted = true;      //调用过这个函数的地址说明就投过票了，将投票状态改为true
        sender.vote = proposal;   //你投给几号提案，这个几号提案就是你传进来的proposal这个整数


    //if 'proposal' is out of the range of the array
    //this will throw automatically and revert all changes
       proposals[proposal].VoteCount  += sender.weight;   //对应几号提案增加投票地址权重的票数
    }

    ///@dev Computes the winning proposal taking all
    ///previous into account.  下面这个函数呢就是计算出最后哪个提案赢得了最多的选票，他就获胜了
    function winningProposal() public view returns(uint winningProposal_)
    {
        uint winningVoteCount  = 0;                                  //先定义一个初始的胜选票数为0
        //通过For循环找到拥有最大VoteCount的提案 以及该提案的索引
        for(uint p = 0;p < proposals.length;p++){
            if(proposals[p].VoteCount > winningVoteCount){
                winningVoteCount = proposals[p].VoteCount;
                winningProposal_ = p;
            }
        }
    }

    //Calls winningProposal() to get the index
    //of the winnner contained in the proposals arry and then
    //return the name of the winner
    //调用 winningProposal()可以返回获胜提案的索引，再通过这个索引获取这个获胜提案的名字；
     function winnerName() external view returns(bytes32 winnerName_){
        winnerName_ = proposals[winningProposal()].name;
    }


//下面这个函数用于将字符串转化为bytes32
function getBytes32ArrayForInput() pure public returns (bytes32[5] memory b32Arr) {
    b32Arr = [bytes32("Fredhan"), bytes32("Jack"), bytes32("lucy"),bytes32("Jay"),bytes32("Mary")];
}

// 下面是跑了上面这个function返回的bytes32的值 可以传入constructor 中
//["0x4672656468616e00000000000000000000000000000000000000000000000000","0x4a61636b00000000000000000000000000000000000000000000000000000000","0x6c75637900000000000000000000000000000000000000000000000000000000","0x4a61790000000000000000000000000000000000000000000000000000000000","0x4d61727900000000000000000000000000000000000000000000000000000000"]


}
