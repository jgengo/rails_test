class NotifChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notif_channel'
  end

  def unsubscribed
    stop_all_streams
  end
end
