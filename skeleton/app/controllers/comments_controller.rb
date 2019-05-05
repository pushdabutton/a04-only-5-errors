class CommentsController < ApplicationController

    before_action :ensure_logged_in

    def new
        @comment = Comment.new
    end


    def create
        @comment = Comment.new(comment_params)
        @comment.link_id = params[:link_id]
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to link_url(@comment.link)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to link_url(@comment.link)
    end


    def comment_params
        params.require(:comment).permit(:body)
    end

end
