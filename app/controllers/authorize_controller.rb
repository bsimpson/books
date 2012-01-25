class AuthorizeController < ApplicationController
  def new
    consumer = OAuth::Consumer.new(Goodreads::KEY, Goodreads::SECRET, :site => Goodreads::URL)
    @request_token = consumer.get_request_token
    session[:request_token] = @request_token
  end

  def create
    access_token = session[:request_token].get_access_token
    user_id = Goodreads.get_auth_user_info(access_token)['user']['id']
    session[:user_id] = user_id
    Goodreads.find_or_create_by_user_id(user_id, :access_token => access_token).save
    redirect_to root_path
  end

  def index
    user = Goodreads.find_by_user_id(session[:user_id])
    render :inline => user.get_isbns(per_page: 200).inspect
  end
end
