class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def like
    #binding.pry
    @picture = Picture.find(params[:id])
    @picture.update_likes(current_user)
    respond_to do |f|
      #binding.pry
      f.html { redirect_to root_path }
      f.json { render json: { picture_id: @picture.id,
        heart_class: @picture.heart_class(current_user),
        likes_message: @picture.likes_message(current_user) }}
    end
  end

end

#like/unlike:
# {"_method"=>"post",
#  "authenticity_token"=>
#   "wpogm0u6QXvJnFJ3T99ZrohPSvcAgPqbNbicYD1/IaYyPmge94Fkf5boNH2hGaPOjzmdRTaHgC7lInceSjm8Lw==",
#  "controller"=>"pictures",
#  "action"=>"like",
#  "id"=>"1"}

# def heart_class(user)
#   if user_liked?(user)
#     "glyphicon glyphicon-heart red-heart"
#   else
#     "glyphicon glyphicon-heart grey-heart"
#   end
# end

# <span class="<%= picture.heart_class(current_user) %>"></span>
