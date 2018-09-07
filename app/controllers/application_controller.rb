# frozen_string_literal: true

# Base controller for the application.
class ApplicationController < ActionController::Base
  def check_account
    redirect_to accounts_path if current_user.account.nil?
  end
end
