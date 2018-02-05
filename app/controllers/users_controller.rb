class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params [:slug])
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/user/signup'
    else
      redirect to '/books'
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

  get '/login' do
    if !logged_in?
      erb :"/user/login"
    else
      redirect to "/books/index"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/books'
    else
      redirect to '/login'
    end
  end

end
