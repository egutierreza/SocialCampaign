

var eventEmitter = new events.EventEmitter();



var myEventHandler = function(){
   options = {
      url: url + id + key,
      method: 'GET',
      headers: {
         'Accept': 'application/json'
      }
   }

   request(options, function(err, res, body){
      obj = JSON.parse(body);
      console.log(obj.items[0].statistics.viewCount);
   });
}






