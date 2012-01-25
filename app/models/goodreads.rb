class Goodreads < ActiveRecord::Base
  include ApiUtils
  extend ApiUtils

  KEY = YAML::load_file("#{Rails.root}/config/goodreads_api.yml")[Rails.env]['key']
  SECRET = YAML::load_file("#{Rails.root}/config/goodreads_api.yml")[Rails.env]['secret']
  URL = 'http://www.goodreads.com'

  def get_isbns(options={})
    shelf = options.delete(:shelf) || 'to-read'
    per_page = options.delete(:per_page) || 1
    page = options.delete(:page) || 1
    sort = options.delete(:sort) || 'position'
    order = options.delete(:order) || 'a'
    search = options.delete(:search) || ''
    id = options.delete(:id) || self.user_id

    parse(access_token.get(fetch("review/list.xml", {per_page: per_page, page: page, sort: sort, order: order, search: search, id: id, v: 2})))['reviews']['review'].map {|x| x['book'] }
  end

  def self.get_auth_user_info(access_token_object)
    parse(access_token_object.get(fetch("api/auth_user")))
  end

  # Marshal load and dump the damned AccesToken object, since fuck knows how to recreate it
  def access_token
    value = super
    return nil if value.nil?
    Marshal.load(value)
  end

  def access_token=(arg)
    super(Marshal.dump(arg))
  end
end
