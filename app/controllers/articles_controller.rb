# Notice, controller uses a plural form name, while model uses a singular form name.
class ArticlesController < ApplicationController
	# Use basic HTTP authentication.
	http_basic_authenticate_with name: 'user', password: '1234', except: [:index, :show]

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
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		# Create a new instance of the Article class.
		@article = Article.new(article_params)

		if @article.save
			# Save it in the database (automatically handled by Active Record). Re-direct to the article id path.
			redirect_to @article
		else
			# Validation fails. Go back to the create page.
			# Use render instead of redirect_to, so that params[:article] will not be refreshed.
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		# Similar to create method, checks whether the update is successful.
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end


	# Private methods must be put after all public methods.
	private
	# Only allows the :title and :content field in the POST request to be submitted to the database.
	def article_params
		params.require(:article).permit(:title, :content)
	end
end
