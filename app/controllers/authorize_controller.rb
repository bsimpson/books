class AuthorizeController < ApplicationController
  def new
    @consumer = OAuth::Consumer.new(Goodreads::KEY, Goodreads::SECRET, :site => Goodreads::URL)
    @request_token = @consumer.get_request_token
    session[:request_token] = @request_token
  end

  def create
    @access_token = session[:request_token].get_access_token
    redirect_to root_path
  end

  def index
  end
end
