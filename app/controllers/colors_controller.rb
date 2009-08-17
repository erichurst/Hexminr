require "twitter"
class ColorsController < ApplicationController
  
  def index
  end
  
  def create
    usernames = params[:usernames].gsub(/[@,]/,'').split(/[\s]/)
    
    unless usernames.empty?
      render :update do |page|
        page << "if($$('result')){"
          page.replace_html "results"
        page << "}"
        page.insert_html :top, "results", "<h3>Those are some nice colors!</h3>"
      
        usernames.each do |username|
          @user = Twitter.user(username)
          page << "if($('fat_finger')){"
            page.visual_effect :fade, "fat_finger", :duration => "0.3"
          page << "}"
          page.insert_html :bottom, "results", :partial => "result"
          page.visual_effect :highlight, "results", :startcolor => "#6CC", :endcolor => "#FFF"
          page[:entry_form].reset
        end
      end
    else
      render :update do |page|
        page.insert_html :top, "header", "<div id='fat_finger'><h2>FAT FINGER ALERT: Hexminr requires a Twitter username</h2></div>"
      end
    end
  end

end
