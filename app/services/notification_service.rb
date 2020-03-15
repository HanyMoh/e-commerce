class NotificationService
  require 'httparty'
  FIREBASE_SERVER_API_KEY = 'AAAAkyBCH9o:APA91bGFJQRYH72sRzm_FAwGq22vPPX6Y9lJomQO1uuAkqUic_ckll4oV6Z2-VdDfkQuNe_sCFQQgJR24QmqioDiyekcY04b9jonItd-VWPc-ewf2BbTQa6F61i4XJsTbBkdumQezp0G6SkFs6WsOgYAWu4VxXJr8w'
  FIREBASE_NOTIFICATION_URL = 'https://fcm.googleapis.com/fcm/send'
  def self.send_notification(headers = {}, params = {}, notification, device_token)
    # this is our header we will place our server api key

    headers['Authorization'] = "key=#{FIREBASE_SERVER_API_KEY}"
    headers['Content-Type'] = 'application/json'

    # Here is the body and here we will pass FIREBASE_NOTIFICATION_URL#####

    params = notification_params(notification, device_token)
    body = JSON.generate(params)
    response = HTTParty.post(FIREBASE_NOTIFICATION_URL,
                             body: body,
                             headers: headers)
    puts '****************'
    puts response.body, response.code
  end

  def self.notification_params(notification, device_token)
    params = {}
    params[:registration_ids] = device_token
    params[:priority] = 'high'
    data = {}
    data[:campaign_name] = notification.name
    data[:brand_name] = notification.brand.name
    data[:brand_logo] = notification.brand.logo_url
    data[:organization_name] = notification.organization.name
    data[:notification_text] = notification.campaign_coupon.notification_text
    data[:message_text] = notification.campaign_coupon.message_text
    data[:coupon_description] = notification.campaign_coupon.description
    data[:coupon_hight_screen_image] = notification.campaign_coupon.hight_screen_image_url
    data[:coupon_width_screen_image] = notification.campaign_coupon.width_screen_image_url
    data[:coupon_name] = notification.campaign_coupon.name
    data[:coupon_url] = notification.campaign_coupon.url
    params[:data] = data
    params
  end
end
