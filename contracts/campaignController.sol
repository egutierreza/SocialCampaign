/*
   To do
   ALL:
      Add contract creation and instantiation existance checker

   crateCampaign:
      crates a campaign based on input parameters, stores it in the
      contractsOwned map for later reference.
   acceptJob:
      Allows the user to accept a job, adding it to their contractsTaken
      map, and setting the contract campainger.
   abandonJob:
      Allows the user to remove himself as campaigner for the 
      specified contract.
*/

pragma solidity ^ 0.5.0

import './SocialCampaign.sol'

contract CampaignController {
   
   mapping(address => address[]) public contractsOwned;
   mapping(address => address[]) public contractsTaken;
   mapping(address => address) public contractOwner;
   mapping(address => address) public contractCampaigner;

   function createCampaign() public returns (bool success){
      address s = address(new SocialCampaign(
         owner,
         videoID,
         targetLikes,
         targetVal,
         campaignOracle
      ))
      contractsOwned[msg.sender].push(s);
      contractOwner[s] = msg.sender;
      return true;
   }
   function acceptJob(address campaign) public returns (bool success){
      if(contractCampaigner[campaign] != msg.sender)||(contractOwner[campaign] == msg.sender)
         return false;
      SocialCampaign s = SocialCampaign(campaign);
      if(s.takeJob()){
         contractsTaken[msg.sender].push(campaign);
         contractCampaigner[campaign] = msg.sender;
         return true;
      }
      return false;
   }
   function abandonJob(address campaign) public returns(bool success){
      if(contractCampaigner[campaign] != msg.sender)||(contractOwner[campaign] == msg.sender)
         return false;
      SocialCampaign s = SocialCampaign(campaign);
      if(s.quitJob()){
         return removeCampaign(msg.sender, campaign);
      }
      return false;
   }
   function startJob(address campaign) public payable returns(bool success){
      if(contractOwner[campaign] != msg.sender)
         return false;
      SocialCampaign s = socialCampaign(campaign);
      return s.enableJob();
   }
   function disableJob(address campaign) public returns(bool success){
      if(contractOwner[campaign] != msg.sender)
         return false;
      SocialCampaign s = socialCampaign(campaign);
      return s.disableJob();
   }
}
