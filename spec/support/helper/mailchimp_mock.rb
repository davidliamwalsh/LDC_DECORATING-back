module MailchimpHelper

  def mock_campaigns
    stub_request(:post, "https://us20.api.mailchimp.com/3.0/campaigns").
    with(
      body: "{\"type\":\"regular\",\"recipients\":
      {
        \"list_id\":\"1c365dac98\"},
        \"settings\":
        {
          \"subject_line\":\"New News from LDC Decorating Contractors\",
          \"title\":\"New News Article\",
          \"from_name\":\"LDC Decorating Contractors\",
          \"reply_to\":\"ldcdecoratingcontractors@davidwalsh.co.uk\",
          \"template_id\":129562
        }
      }",
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization'=>'Basic YXBpa2V5OmNmMGM4ODhlMjZlZWJiMjhiMmU4Nzg4MGY0MDQ5NzQ4LXVzMjA=',
      'Content-Type'=>'application/json',
      'User-Agent'=>'Faraday v0.15.4'
      })
  end
end