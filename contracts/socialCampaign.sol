pragma solidity ^ 0.5.0;

contract SocialCampaign {
   
   address oracle;

   //Job Info
   bytes32 public videoID;
   address[] delegates;
   address payable owner;
   address payable campaigner;
   uint public state = 0;
   //0 - Inactive
   //1 - Active
   //2 - Expired
   //3 - Success
   uint public bounty;

   _DateTime deadline;

   //Target Values
   uint public targetLikes;
   uint public targetViews;

   constructor(
      address payable o,
      bytes32 target, 
      uint likesVal, 
      uint viewsVal,
      address campaignOracle
   ) public{
      owner = o;
      campaigner = o;
      videoID = target;
      targetLikes = likesVal;
      targetViews = viewsVal;
      oracle = campaignOracle;
      if(msg.sender != owner){
         delegates.push(msg.sender);
      }
   }
   //Interactive functions
   function validateJob() public returns(bool success){
      if(oracle == msg.sender){
         campaignSuccess = true;
         campaigner.transfer(bounty);
         state = 2;
         return true;
      }
      return false;
   }
   function addDelegate(address newDelegate) public returns(bool success){
      if((owner == msg.sender)||(isDelegate(msg.sender))){
         delegates.push(newDelegate);
         return true;
      }
      return false;
   }
   function changeOracle(address newOracle) public returns(bool success){
      if(((owner == msg.sender)||(isDelegate(msg.sender)))&&(state != 1)){
         oracle = newOracle;
         return true;
      }
      return false;
   }
   function setDeadline(uint16 y, uint8 m, uint8 d, uint8 h, uint8 i, uint8 s){
      deadline.year = y;
      deadline.month = m;
      deadline.day = d;
      deadline.hour = h;
      deadline.minute = i;
      deadline.second = s;
   }
   function takeJob() public returns (bool success){
      if((campaigner == owner)&&(owner != msg.sender)){
         campaigner = msg.sender;
         return true;
      }
      return false;
   }
   function quitJob() public returns (bool success){
      if(campaigner == msg.sender){
         campaigner = owner;
         return true;
      }
      return false;
   }
   function enableJob() public payable returns (bool success){
      if(((owner == msg.sender)||(isDelegate(msg.sender)))&&(state == 0)){
         state = 1;
         bounty = msg.value;
         return true;
      }
      return false;
   }
   function disableJob() public returns (bool success){
      if(((owner == msg.sender)||(isDelegate(msg.sender)))&&(campaigner == owner)){
         state = 0;
         owner.transfer(bounty);
         return true;
      }
      return false;
   }
   function isDelegate(address target) internal view returns (bool success){
      for(uint i = 0; i < delegates.length; ++i)
         if(target == delegates[i])
            return true;
      return false;  
   }
}
