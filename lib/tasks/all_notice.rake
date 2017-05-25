namespace :notice do

	task :all do
		######## envia una notificación a todos los dispositovos en la base de datos ###########
    @notice = "Enviando una notificación a todos los dispositivos 'prueba'"
	  @devices = Device.all
	
	  app_ios = Rpush::Apns::App.find_by_name("gbtm")
    if app_ios.nil?
      app_ios = Rpush::Apns::App.new
      app_ios.name = "gbtm"
      app_ios.certificate = File.read("#{Rails.root}/public/certs/push.pem")
      app_ios.environment = "development" # APNs environment.
      app_ios.password = "merol777c"
      app_ios.connections = 1
      app_ios.save!
    end
    @devices.each do |device|
	    if device.system == "iOS"
	    n = Rpush::Apns::Notification.new
	    n.app = app_ios
	    n.device_token = "#{device.device}" # 64-character hex string
	    n.alert = "#{@notice}"
	    n.data = { foo: :bar }
	    n.sound = "default"
	    n.save!
	    end
    end
    Rpush.push

  end


end