
const url = "https://www.googleapis.com/youtube/v3/videos?part=statistics&id="
const key = "&key=AIzaSyDJFzT33GYUAAG5tEZISJX1yzKGToHx7bw"
var vidURL;

App = {
   web3Provider: null,
   contracts: {},

   init: async function(){
      return await App.initWeb3();
   },

   initWeb3: async function(){
      if(window.ethereum){
         App.web3Provider = window.ethereum;
         try{
            await window.ethereum.enable();
         }
         catch(error){
            console.error("User denied account access");
         }
      }
      else if(window.web3){
         App.web3Provider = window.web3.currentProvider;
      }
      else{
         App.web3Provier = new Web3.providers.HttpProvider('http://localhost:7545');
      }
      web3 = new Web3(App.web3Provider);
      $('.user-address').html(web3.eth.accounts[0]);
      App.initContract();
      
   },

   initContract: function(){
      $.getJSON('SocialCampaign.json', function(data){
         var SocialCampaignArtifact = data;
         App.contracts.SocialCampaign = TruffleContract(SocialCampaignArtifact);
         App.contracts.SocialCampaign.setProvider(App.web3Provider);
         return App.showRequest();
      });
   },

   showRequest: function(){
      App.showContractAddress();
      App.showTargetViews();
      App.showID();
      App.showClaimant();
      App.showOwner();
   },
   showContractAddress: function(){
      App.contracts.SocialCampaign.deployed().then(function(instance){
         $('.contract-address').html(instance.address);
      });
   },
   /*
   validateJob: function(){
      var campaignInstance;
      web3.eth.getAccounts(function(error, accounts){
         if(error){
            console.log(error);
         }
         var account = accounts[0];
         App.contracts.SocialCampaign.deployed().then(function(instance){
            campaignInstance = instance;
            campaignInstance.validateJob({from: account});
         }).then(function(result){
            return App.bindEvents();
         }).catch(function(err){
            console.log(err.message);
         });
      });
      
   },
   */
   bindEvents: function(){
      window.ethereum.on('accountsChanged', function(accounts){
         $('.user-address').html(web3.eth.accounts[0]);
         App.initContract();
      });
      $.getJSON(vidURL, function(data){
         console.log(data);
         $('.current-views').html(data.items[0].statistics.viewCount);  
      });
   },
   showOwner: function(){
      var campaignInstance;
      App.contracts.SocialCampaign.deployed().then(function(instance){
         campaignInstance = instance;
         return campaignInstance = instance;
      }).then(function(address){
         $('.owner-address').html(address);
      }).catch(function(err){
         console.log(err.message);
      });

   },
   showID: function(){
      var campaignInstance;
      App.contracts.SocialCampaign.deployed().then(function(instance){
         campaignInstance = instance;
         return campaignInstance.videoID.call();
      }).then(function(videoID){
         vidURL = url + web3.toUtf8(videoID) + key;
         console.log(vidURL);
         $('.video-id').html(web3.toUtf8(videoID));
         return App.bindEvents();
      }).catch(function(err){
         console.log(err.message);
      });
   },
   showClaimant: function(){
      var campaignInstance;
      App.contracts.SocialCampaign.deployed().then(function(instance){
         campaignInstance = instance;
         return campaignInstance.campaigner.call();
      }).then(function(address){
         console.log(address);
         $('.claimant-address').html(address);
      }).catch(function(err){
         console.log(err.message);
      });
   },
   showTargetViews: function(){
      App.contracts.SocialCampaign.deployed().then(function(instance){
         campaignInstance = instance;
         return campaignInstance.targetViews.call();
      }).then(function(views){
         console.log(views.toString());
         $('.target-views').html(views.toString());
      }).catch(function(err){
         console.log(err.message);
      });
   },
};

$(function() {
   $(window).load(function() {
      App.init();
   });
});
