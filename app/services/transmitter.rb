class Transmitter

  require "faraday_middleware"

  URL_ENV = "SUBMISSION_TRANSMIT_API".freeze
  
  def self.BuildJSON(submission)

    businesses = []
    if submission.businesses.length > 0
      submission.businesses.each do |business|
        businesses.push({ name: business.name, street: business.street, townorcity: business.townorcity, county: business.county, postcode: business.postcode, url: business.url })
      end
    end

    evidence_files = []

    if submission.evidencefiles.attached?
      submission.evidencefiles.each do |single|
        evidence_files.push({ key: single.key, filename: single.filename })
      end
    end

    body = {
      method: "Submission.Submit",
      payload: {
        submission: submission,
        businesses: businesses,
        evidence_files: evidence_files,
      }
    }.to_json

  end

  
  def self.Transmit(submission)

    if ENV.key?(URL_ENV)

      url = ENV.fetch(URL_ENV)
      
      conn = Faraday.new do |f|
        f.response :json # decode response body as JSON
      end
      
      response = conn.post(url, BuildJSON(submission), "Content-Type" => "application/json")

      if response.body["success"]
        response.body["data"]
      else
        Rails.logger.warn "API failed"
        Rails.logger.warn response.body["error"] if response.body["error"].present?
        nil
      end

    end

  end


    
end