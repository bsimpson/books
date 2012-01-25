class Luzme
  APP_KEY = YAML::load_file("#{Rails.root}/config/luzme_api.yml")[Rails.env]['app_key']
  APP_ID = YAML::load_file("#{Rails.root}/config/luzme_api.yml")[Rails.env]['app_id']
  URL = 'http://www.luzme.com'

  def self.search(title="", author="")
    fetch('api/beta/book', {author: URI.encode(author), title: URI.encode(title)})
  end

  def self.fetch(url, params={})
    uri = "#{Luzme::URL}/#{url}?app_key=#{Luzme::APP_KEY}&app_id=#{Luzme::APP_ID}&format=json"
    uri += "&" + params.to_a.map {|x| x.join('=')}.join('&') if params.present?
    puts uri
    Net::HTTP.get(URI.parse(uri))
  end

  def self.parse(response)
    #JSON.parse(response)
    response
  end
end
