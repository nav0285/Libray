class BooksController < ApplicationController

before_filter :self_load, :only=>[:edit,:show,:update,:destroy]

  def index
    @books=Book.where(:subject_id=>params[:id])
  end

  def new 
    @book=Book.new
    @subjects=Subject.all
  end

  def create 
    @book=Book.new(params[:book])
       if @book.save
        redirect_to root_url, :notice=>'New Book has been added'
       else 
        render :action=>'new'
       end
  end

  def edit
  end

  def update
    if @book.update_attributes(params[:book])
       redirect_to books_path, :notice=>'Book has been updated'
    else
       render :action=>'edit'
    end
  end

  def show
  end

  def destroy
    @book.destroy
    redirect_to root_url
  end

  def self_load
    @book=Book.find(params[:id])
  end

end
