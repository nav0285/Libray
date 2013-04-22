class SubjectsController < ApplicationController
 
  before_filter :self_load, :only=>[:edit,:show,:update,:destroy]

  def index
    @subjects=Subject.find(:all)
    @books=Book.find(:all)
  end

  def new 
    @subject=Subject.new
  end

  def create 
    @subject=Subject.new(params[:subject])
    if @subject.save
       redirect_to root_url, :notice=>'New subject has been added'
    else 
       render :action=>'new'
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes(params[:subject])
       redirect_to root_url, :notice=>'Subject has been updated'
    else
       render :action=>'edit'
    end
  end

  def show
  end

  def destroy
    @subject.destroy
    redirect_to root_url
  end

  def self_load
    @subject=Subject.find(params[:id])
  end

end
