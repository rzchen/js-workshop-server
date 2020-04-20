require 'net/http'

class GithubJobService
  # Parameters
  #
  # description — A search term, such as "ruby" or "java". This parameter is aliased to search.
  # location — A city name, zip code, or other location search term.
  # lat — A specific latitude. If used, you must also send long and must not send location.
  # long — A specific longitude. If used, you must also send lat and must not send location.
  # full_time — If you want to limit results to full time positions set this parameter to 'true'.
  # Examples
  #
  # https://jobs.github.com/positions.json?description=python&full_time=true&location=sf
  # https://jobs.github.com/positions.json?search=node
  # https://jobs.github.com/positions.json?lat=37.3229978&long=-122.0321823

  JOB_URL = 'https://jobs.github.com/positions.json'.freeze
  def initialize(**params)
    @uri = URI(JOB_URL)
    @uri.query = URI.encode_www_form(params) if params.present?
  end

  def perform
    res = Net::HTTP.get_response(@uri)
    return JSON(res.body) if res.is_a?(Net::HTTPSuccess)

    {  errors: 'Failed' }
  end

  private


end
