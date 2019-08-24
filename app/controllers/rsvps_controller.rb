class RsvpsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if Rails.env.production? && !request.env['HTTP_ORIGIN'].match?(/https?:\/\/(www.)?rachelandjames.wedding/)
      Rails.logger.info("Skipping RSVP from #{request.env['HTTP_ORIGIN']}")
      head :ok and return
    end

    rsvp = Rsvp.new(rsvp_params)

    params.fetch(:rsvp).fetch(:pluses, []).each do |plus|
      rsvp.pluses.new(name: plus[:name], attending: plus[:attending])
    end

    if rsvp.save
      rsvp.deliver
    end

    head :ok
  end

  def index
    unless params[:token] == ENV.fetch('CSV_TOKEN')
      Rails.logger.info("Skipping RSVP index #{request.env['HTTP_ORIGIN']}")
      head :not_found and return
    end

    send_data Rsvp::Summary.new(Rsvp.all).to_csv,
      filename: Date.today.strftime("rsvps.%Y%m%d%H%M%S.csv")
  end

  private

  def rsvp_params
    params.
      require(:rsvp).
      permit(
        :name,
        :email,
        :attending,
        :diet,
        :comments
      )
  end
end