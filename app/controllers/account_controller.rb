# frozen_string_literal: true

class AccountController < ApplicationController
  before_action :authenticate_user!
  def index
    @account = current_user.account
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def show; end

  def create
    account = Account.new(account_params)
    account.user_id = current_user.id
    if account.save
      flash[:notice] = 'account created!'
    else
      flash[:alert] = account.errors.messages
    end
    redirect_to action: 'index'
  end

  def update
    account = Account.find(params[:id])
    if account.update_attributes(account_params)
      flash[:notice] = 'account updated!'
    else
      flash[:alert] = 'Failed to edit Account!'
    end
    redirect_to action: 'index'
  end

  def destroy
    account = Account.find(params[:id])
    if account.delete
      flash[:notice] = 'Account deleted!'
    else
      flash[:alert] = 'Failed to delete this Account!'
    end
    redirect_to action: 'index'
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :identification, :phone_number)
  end
end
