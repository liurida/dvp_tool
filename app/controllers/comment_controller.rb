class CommentController < ApplicationController

  def create
    #create model comment based on model_name

    model = params[:model_name].constantize
    obj = model.find_by_id(params[:id])
    if current_user
      comment = Comment.build_from(obj,current_user.id,params[:comment])
      comment.save
      flash[:notice] = 'Comment Added'
    else
      flash[:notice] = 'Can not added comment, please login firstly'
    end
    redirect_to params[:next_url]

  end

  def destroy
    #Remove comment
  end
end
