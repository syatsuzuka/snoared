class AccountsController < ApplicationController
  before_action :accounts_params, only: %i[create update]
  before_action :set_user, only: %i[new create edit update]
  before_action :set_account, only: %i[edit update]

  def new
    @account = Account.new
    authorize @account
  end

  def create
    @account = Account.new(accounts_params)
    @account.user = @user
    authorize @account

    if @account.save!
      redirect_to gears_path
    else
      render :new
    end
  end

  def edit
    authorize @account
  end

  def update
    @account.user = @user
    authorize @account

    if @account.update(accounts_params)
      redirect_to gears_path
    else
      render :edit
    end
  end

  private

  def accounts_params
    params.require(:account).permit(:first_name, :last_name, :address, :user_id, :photo)
  end

  def set_user
    @user = current_user
  end

  def set_account
    @account = @user.account
  end
end
