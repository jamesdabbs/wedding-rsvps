require 'csv'

class Rsvp
  class Summary
    def initialize(responses)
      @responses = responses.includes(:pluses).order(created_at: :asc)
    end

    def to_csv
      CSV.generate do |csv|
        csv << [
          'Sent',
          'Name',
          'Email',
          '# Attending',
          'Diet',
          'Comments',
          'Guests'
        ]

        @responses.find_each do |rsvp|
          base = [
            rsvp.created_at,
            rsvp.name,
            rsvp.email,
            rsvp.party.count(&:attending?),
            rsvp.diet,
            rsvp.comments
          ]
          rsvp.pluses.each do |plus|
            next unless plus.attending?
            base << plus.name
          end
          csv << base
        end
      end
    end
  end
end