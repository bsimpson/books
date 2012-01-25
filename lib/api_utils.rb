module ApiUtils
  def fetch(url, params={})
    uri = "#{Goodreads::URL}/#{url}?key=#{Goodreads::KEY}"
    uri += "&" + params.to_a.map {|x| x.join('=')}.join('&') if params.present?
    puts uri
    uri
  end

  def parse(result)
    Hash.from_xml(result.body)['GoodreadsResponse']
  end
end
