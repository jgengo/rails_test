App.notif = App.cable.subscriptions.create("NotifChannel", {
  connected: function() { },

  disconnected: function() { },

  received: function(data) {
    alert(data);
    location.reload();
  }
});