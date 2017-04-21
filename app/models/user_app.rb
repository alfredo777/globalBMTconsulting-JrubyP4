class UserApp < ActiveRecord::Base
	establish_connection $DB1_CONF ###### se establece la conección a la base de datos interna
    self.table_name = 'user_apps'

    mount_uploader :avatar, AvatarUploader
    mount_uploader :presentation_card_behind, CardBehindUploader
    mount_uploader :presentation_card_front, CardFrontUploader
    mount_uploader :bussines_avatar, LogoUploader

end
