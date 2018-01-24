class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @books = Books.all
      erb :'/books/index'
    else
      redirect to '/login'
    end
  end

end
