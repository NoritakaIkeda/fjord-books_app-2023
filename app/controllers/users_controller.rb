# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order('id ASC').page(params[:page]).per(1)
  end
end
