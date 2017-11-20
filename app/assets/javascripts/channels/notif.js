App.notif = App.cable.subscriptions.create("NotifChannel", {
  connected: function() { },

  disconnected: function() { },

  received: function(data) {
  	$('#'+data.id).text( (data.distance / 1000).toFixed(1) )
  }
});