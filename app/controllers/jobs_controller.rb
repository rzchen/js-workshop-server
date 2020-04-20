class JobsController < ApplicationController
  def index
    result = GithubJobService.new(job_params.to_h.symbolize_keys).perform

    render json: JSON(result) 
  end
  
  private

  def job_params
    params.permit(:description, :search, :location, :lat, :long, :full_time, :page)
  end
end
