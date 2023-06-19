require 'faker'

class QuoteGeneratorWorker
  include Sidekiq::Worker

  def perform
    Turbo::StreamsChannel
      .broadcast_replace_to(:quote,
                          target: :quote,
                           partial: 'tasks/quote',
                           locals: { quote: Faker::Games::WorldOfWarcraft.quote })
  end
end
