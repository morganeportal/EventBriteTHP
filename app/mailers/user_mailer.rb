class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://EventBriteTHP.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def confirmation_email(user,event)
  	@user = user
  	@event = event

    @url  = 'http://EventBriteTHP.fr/login' 

    subject_string = "Confirmation d'inscription à : "+@event.title+"."

  	mail(to: @user.email, subject:subject_string)

  end

end
