class ArticlesController < ApplicationController

# each def refers to creating a page in the articles folder and gives 
# it some kind of action, for example, all will index, show will show, 
# create will make a new item... etc. 
def index
	@articles = Article.all
	end

def edit
	@article = Article.find(params[:id])
end

def show
	@article = Article.find(params[:id])
end

def new
	@article = Article.new
  end
 
def create
  @article = Article.new(article_params)

  if @article.save
  	redirect_to @article
  else
  	render 'new'
  end
end


def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
#why do we need to type end twice? because if / else?

private
def article_params
	params.require(:article) .permit(:title, :text)
end

end