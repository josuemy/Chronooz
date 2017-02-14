class PagesController < ApplicationController

  def show
    @paramList = params[:id].split(/[\?\s\!\-]/)
    uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "0dca823a2ab54213962f9fd1977c3ea5",
      # "q" => @paramList.first + " " + @paramList.last + " " + @paramList[@paramList.length/2-1] + " " + @paramList[@paramList.length/2] ,
      "q" => get_upper,
      "sort" => "newest"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
    @ret = get_upper
  end

  def get_upper
    @keywords = ""
    @paramList.each do |param|
      if((param[0] == param[0].upcase)&& (param.length != 0))
        @keywords += param + " "
      end
    end
    @keywords.rstrip
  end

  def test
    uri = URI("https://newsapi.org/v1/articles?source=google-news&apiKey=c1f5522cf45c4cf8ba492ace801113d0")
    response = Net::HTTP.get(uri)
    @result = JSON.parse(response)
  end


end
