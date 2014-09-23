#!/usr/bin/env ruby
# encoding: utf-8

require 'sinatra/base'
require 'haml'
require 'date'
require_relative './lib/howold'

Httpd_log = '~/lruby/mokumoku/howold/log/http_log.txt'

class MainApp < Sinatra::Base
  set :public_folder, File.expand_path(File.join(root, '..', 'public'))

  get '/' do
    td = Date.today
    @today = td.strftime("%Y-%m-%d")
    haml :index
  end

  post'/howold' do
    birthday = date_validate(@params[:birthday]) 
    basedate = date_validate(@params[:basedate])
    unless(birthday && basedate)
      redirect '/'
    end
    @agevalue = age_calculate(birthday, basedate)
    @basedate = "#{basedate[0]}年#{basedate[1]}月#{basedate[2]}日"
    haml :howold
  end
end
