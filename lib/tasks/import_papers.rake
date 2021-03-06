desc 'Import Paper records from setup importers'
task import_papers: :environment do
  require 'open-uri'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  api_key = Rails.application.config_for(:morph)["key"]
  uri = URI.parse("https://api.morph.io/jrlover/city_council_leipzig_recent_papers/data.json?key=#{api_key}&query=select%20*%20from%20%27data%27")
  Paper.import_from_json(uri.read)
end
