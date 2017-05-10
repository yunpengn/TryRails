class CommentsController < ApplicationController
	# Use basic HTTP authentication.
	http_basic_authenticate_with name: 'user', password: '1234', except: [:destroy]

	# For public methods of CRUD features, put them in the following order: show, new, edit, create, update, destroy.
	# There is no show, new, edit method for comments controller because there is no seperate views for these actions.
	def create
		@article = Article.find(params[:article_id])
		
		if @article.comments.create(comment_params)
			redirect_to article_path(@article)
		else
			render article_path(@article)
		end
	end

	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])

		if @comment.update(comment_params)
			redirect_to article_path(@article)
		else
			render article_path(@article)
		end
	end

	def destroy
		@article = Article.find(parmas[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path(@article)
	end


	private
	def comment_params
		params.require(:comment).permit(:user, :content)
	end
end
