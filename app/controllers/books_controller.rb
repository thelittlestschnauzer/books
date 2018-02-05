class BooksController < ApplicationController

  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'/books/index'
    else
      redirect to '/login'
    end
  end

  post '/books' do
    if params[:title] == "" || params[:description] == ""
      redirect to "/books/new"
    else
      @book = current_user.books.create(params)
      redirect to "/books/#{@book.id}"
    end
  end

  get '/books/:id' do
      if logged_in?
        @book = Book.find_by_id(params[:id])
        erb :'/books/show'
      else
        redirect to '/login'
      end
    end


end
