class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "admin",
		except: [:index,:show]




	# Show All Articles
	def index
		@articles = Article.all
	end
	#Show :id Article [GET]
	def show
		@article = Article.find(params[:id])
	end
	#Create Article View [GET]
	def new
		@article = Article.new
	end

	#create article method [POST]
	def create 
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	# Edit View [GET]
	def edit
		@article = Article.find(params[:id])
	end
	# Update Articel [PATCH/PUT]
	def update 
		@article = Article.find(params[:id])
			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
		end
	end
	# DELETE Article [DELETE] !
	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
	
	#Code Omptimization
	private 
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
