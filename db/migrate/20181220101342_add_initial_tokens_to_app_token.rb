class AddInitialTokensToAppToken < ActiveRecord::Migration[5.1]
  def change
  	AppToken.create(token: "a~rR-*Zd9t~H8wm@CmPd0", title: 'NavBox_App_Token', platform: 0)
	AppToken.create(token: "a~rR-*Zd9t~H8wm@CmPd1", title: 'Dashboard_App_Token', platform: 1)
	AppToken.create(token: "a~rR-*Zd9t~H8wm@CmPd2", title: 'Mobile_App_Token', platform: 2)
  end
end
