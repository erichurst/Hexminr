require "twitter"
class ColorsController < ApplicationController
  
  def index
  end
  
  def create
    username = params[:username].gsub('@','').to_s
    
    if username != ""
      @user = Twitter.user(username)
      render :update do |page|
        page << "if($('fat_finger')){"
          page.visual_effect :fade, "fat_finger", :duration => "0.3"
        page << "}"
        page.replace_html "results", :partial => "results"
        page.visual_effect :highlight, "results", :startcolor => "#6CC", :endcolor => "#FFF"
        page[:entry_form].reset
      end
    else
      render :update do |page|
        page.insert_html :top, "header", "<div id='fat_finger'><h2>FAT FINGER ALERT: Hexminr requires a Twitter username</h2></div>"
      end
    end
  end

end
