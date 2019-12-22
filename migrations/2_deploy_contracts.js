var SocialCampaign = artifacts.require("SocialCampaign");

var owner = "0x06C3216210e3569718438E1AEA99b56AA42eeA0B";
var target = "2aQ129yq_d4";
var likesVal = 100;
var viewsVal = 1000;
var campaignOracle = "0x3c4065816552A9cAa90d4cC162b5c347b48FEd87";

module.exports = function(deployer){
   deployer.deploy(
      SocialCampaign,
      owner,
      web3.utils.asciiToHex(target),
      likesVal,
      viewsVal,
      campaignOracle
   );
}
