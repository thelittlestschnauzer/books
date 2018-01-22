class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/user/signup'
    else
      redirect to "/books"
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/books'
    else
      redirect to '/signup'
    end
  end
end
