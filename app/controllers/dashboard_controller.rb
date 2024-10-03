class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_doctor_role

  def index
    @patients_per_day = Patient.group_by_day(:registered_on).count
  end

  private

  def check_doctor_role
    redirect_to root_path unless current_user.doctor?
  end
end
