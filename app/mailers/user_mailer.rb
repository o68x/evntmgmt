class UserMailer < ApplicationMailer
  default from: 'no-reply@eventmgmt.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_email(att)
    @url  = 'http://monsite.fr/login' 
    @event = Event.find_by(id: att.event_id)
    @user = User.find_by(id: att.user_id)
    @admin = User.find_by(id: @event.user_id)
    p @event.title
    p @admin.first_name
    #@user = att # TODO Pas sûr de mon coup
    #@url  = 'http://monsite.fr/login' 
    mail(to: @admin.email, subject: 'Un nouveau participant !') 
  end
end
