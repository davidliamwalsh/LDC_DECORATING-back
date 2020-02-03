RSpec::Sidekiq.configure do |config|
  # Clears all job queues before each example
  config.clear_all_enqueued_jobs = true # default => true

  # Whether to use terminal colours when outputting messages
  config.enable_terminal_colours = true # default => true

  # Warn when jobs are not enqueued to Redis but to a job array
  config.warn_when_jobs_not_processed_by_sidekiq = true # default => true
end

RSpec.configure do |config|
  config.profile_examples = true
  config.before(:suite) do
    Sidekiq::Testing.fake!
  end
 
  config.around(:example, sidekiq: -> (mode) { !!mode }) do |example|
    unless %i(inline fake disable).include?(example.metadata.fetch(:sidekiq))
      raise "sidekiq must be :inline, :fake or :disable"
    end
    Sidekiq::Testing.send("#{example.metadata.fetch(:sidekiq)}!".to_sym) do
      example.run
    end
  end
end