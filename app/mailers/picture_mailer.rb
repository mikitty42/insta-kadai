class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "mikiaaamiki@yahoo.co.jp", subject: "写真投稿の確認メール"
  end
end
