class SendEmailCampaign

  def initialize
    self.list_id = ENV.fetch("MAILCHIMP_LIST_ID")
    self.template_id = ENV.fetch("MAILCHIMP_TEMPLATE_ID")
    self.gibbon = Gibbon::Request.new
  end

  def self.call
    new.call
  end

  def call
    begin
      campaign = gibbon.campaigns.create(body: body)
      campaign_id = campaign.body.fetch(:id)
      gibbon.campaigns(campaign_id).actions.send.create
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
  end

  private

  attr_accessor :list_id, :template_id, :gibbon

  def recipients
    {
      list_id: list_id
    }
  end

  def settings
    {
      subject_line: "New News from LDC Decorating Contractors",
      title: "New News Article",
      from_name: "LDC Decorating Contractors",
      reply_to: "ldcdecoratingcontractors@davidwalsh.co.uk",
      template_id: 129562
    }
  end

  def body
    {
      type: "regular",
      recipients: recipients,
      settings: settings
    }
  end

end