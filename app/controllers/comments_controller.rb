class CommentsController < ApplicationController
  def index
    # 未検証なのでコメントアウトのまま置いてる
    # @comments = Comment.find_by(topic_id: params[:topic_id])
  end

  def new
  	@comment = Comment.new
    @@topic_id = params[:topic_id]
  end

  def create

    # binding.pry

    @comment = Comment.new()
    @comment.topic_id = @@topic_id
    @comment.comment = comment_params[:comment]

  	if @comment.save
  		redirect_to topics_path, success: 'コメント投稿に成功しました'
  	else
  		flash.now[:danger] = "投稿に失敗しました"
  		render :new
  	end

  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
