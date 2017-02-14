class PagesController < ApplicationController

  def show
    @paramList = params[:id].split(" ")
    uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "0dca823a2ab54213962f9fd1977c3ea5",
      # "q" => @paramList.first + " " + @paramList.last + " " + @paramList[@paramList.length/2-1] + " " + @paramList[@paramList.length/2] ,
      "q" => @result
      "sort" => "newest"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
  end

  def get_upper
    @result = ""
    @paramList.each do |param|
      if(param[0] == param[0].upcase)
        @result += param
      end
    end
    @result
  end

  def test
    uri = URI("https://newsapi.org/v1/articles?source=google-news&apiKey=c1f5522cf45c4cf8ba492ace801113d0")
    response = Net::HTTP.get(uri)
    @result = JSON.parse(response)
  end


end
