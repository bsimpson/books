class Goodreads < ActiveRecord::Base
  KEY = YAML::load_file("#{Rails.root}/config/goodreads_api.yml")[Rails.env]['key']
  SECRET = YAML::load_file("#{Rails.root}/config/goodreads_api.yml")[Rails.env]['secret']
  URL = 'http://www.goodreads.com'

end
