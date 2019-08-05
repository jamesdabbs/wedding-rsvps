class RsvpMailer < ApplicationMailer
  def rsvp(rsvp)
    @rsvp = rsvp

    @message = if rsvp.any_attending?
      "We can't wait to see you in October!"
    else
      "We're sorry to hear you can't make it, but we'll look forward to catching up soon!"
    end

    mail(
      to:       @rsvp.email,
      from:     'rsvp@rachelandjames.wedding',
      cc:       ['james.dabbs+rsvp@gmail.com', 'resullivan12+rsvp@gmail.com'],
      reply_to: ['resullivan12+rsvp@gmail.com'],
      subject:  "RSVP for Rachel & James' Wedding"
    )
  end
end
