pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import {SocialCampaign} from "../contracts/socialCampaign.sol";

contract TestSocialCampaign{
   
   function testConstructor() public{
      address payable owner = msg.sender;
      bytes32 target = "value";
      uint likesVal = 0;
      uint viewsVal = 1000;
      address campaignOracle;

      SocialCampaign s = new SocialCampaign(owner, target, likesVal, viewsVal, campaignOracle);

      Assert.equal(s.owner(), owner, "Owners should be same");
   }
}
