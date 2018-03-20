require "sinatra"
require_relative "add.rb"
require_relative "dev.rb"
require_relative "mult.rb"
require_relative "sub.rb"
get "/" do 
  erb :page_1_login
end

post "/login" do 
  uname = params[:uname]
  password = params[:p_word]
  
  if uname == "anna" && password == "fructose01"
        redirect '/first_num?uname='+ uname
    else 
      error_msg = "Wrong Username or Password:"
        erb :error, locals: {uname: uname}
    end
end

get '/first_num'do
  uname = params[:uname]
  erb :page_2_num_1, locals: {uname: uname, message: "WAY TO GO!!!!"}
end

post '/first_num'do
  uname = params[:uname]
  num1 = params[:num1]
  redirect '/second_num?uname='+ uname + "&num1=" + num1
end

get '/second_num'do
  uname = params[:uname]
  num1 = params[:num1]
  erb :page_3_num_2, locals: {uname: uname, num1: num1}
end

post '/second_num'do
 uname = params[:uname]
  num1 = params[:num1]
  num2 = params[:num2]
  redirect '/operator_num?uname='+ uname + "&num1=" + num1 + "&num2=" + num2
end
get '/operator_num'do
  uname = params[:uname]
  num1 = params[:num1]
  num2 = params[:num2]
  erb :page_4_operator, locals: {uname: uname, num1: num1, num2: num2}
end

post '/operator_num'do
 uname = params[:uname]
  num1 = params[:num1]
  num2 = params[:num2]
  eqaz = params[:equaz]
  result = params[:result]
  # p "#{eqaz}this is eqaz, #{result} this is result!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  
    if eqaz == "plus"
        result = add1(num1.to_i, num2.to_i)
    #    p "#{porduct} yo look here"
    elsif eqaz == "minus"
        result = subtract(num1.to_i, num2.to_i)
    elsif eqaz == "divide"
        result = divide(num1.to_i, num2.to_i)
    else eqaz == "multiply" 
        result = multiple(num1.to_i, num2.to_i)
    end
    # p "#{result}this is it"
    # p "#{uname}name,#{num1}1stnumber,#{num2}2ndnumber,#{eqaz}this is eqaz, #{result}result"
    # "#{first_name} #{last_name} #{first_number} #{second_num} #{operater} this is what your lookin at #{result}  #{porduct}"
    redirect'/page_5_results?uname='+ uname + "&num1=" + num1 + "&num2=" + num2 + "&eqaz=" + eqaz + "&result=" + result.to_s
  end
get '/page_5_results' do
  uname = params[:uname]
  num1 = params[:num1]
  num2 = params[:num2]
  eqaz = params[:eqaz]
  result = params[:result]
  p "#{uname}name,#{num1}1stnumber,#{num2}2ndnumber,#{eqaz}this is eqaz, #{result}result"


  erb :page_5_results, locals: {uname: uname, num1: num1, num2: num2,eqaz: eqaz, result: result.to_s }
end


