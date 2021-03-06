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
    apikey = "73f7dfb5a29a4f88a381e8bcbccb12ff"
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
    errors.add(:email, "unscored") if score < 0.7
  end
end
