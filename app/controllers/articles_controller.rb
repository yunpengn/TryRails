# Notice, controller uses a plural form name, while model uses a singular form name.
class ArticlesController < ApplicationController
	# For public methods of CRUD features, put them in the following order: show, new, edit, create, update, destroy.
	def index
		@articles = Article.all
	end

	def show
		# Use the id field from GET request to find the corresponding article among all articles.
		# Rails will pass all instance variables from the controller to the corresponding views. Therefore, we can display them.
		@article = Article.find(params[:id])
	end

	def new
	end

	def create
		# Create a new instance of the Article class.
		
		@article = Article.new(article_params)
		# Save it in the database (automatically handled by Active Record)
		@article.save
		# Re-direct to the article id path.
		redirect_to @article
	end


	# Private methods must be put after all public methods.
	private
	# Only allows the :title and :content field in the POST request to be submitted to the database.
	def article_params
		params.require(:article).permit(:title, :content)
	end
end
