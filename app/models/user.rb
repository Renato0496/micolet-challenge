require "net/http"
require "net/https"

class User < ApplicationRecord
  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }
  validates :preferences, presence: true
  validate :validate_email_score

  # Associations
  has_and_belongs_to_many :preferences

  private

  def request_score
    apikey = "b7362a85a6b64fec8b4273a9810f2d47"
    uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=#{apikey}&email=#{self.email}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request =  Net::HTTP::Get.new(uri)
    response = http.request(request)
    score = JSON.parse(response.body, { symbolize_names: true })[:quality_score].to_f
    Rails.logger.debug score
    score
  rescue StandardError => e
    Rails.logger.debug { "Error (#{e.message})" }
  end

  def validate_email_score
    score = request_score
    errors.add(:email, "invalid...") if score < 0.7
  end
end
