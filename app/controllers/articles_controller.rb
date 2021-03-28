class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new #so first time page loads, @article.errors doesn't cause crash
    end

    def create
        #render plain: params[:article] #this will show the info in the browser
        #after you click Save
        #require the top level key of article & permit title and desc to be used to create new article object(instance var)
        @article = Article.new(params.require(:article).permit(:title, :description))
        #render plain: @article.inspect #then can see object; can also to @article.inspect
        if @article.save
            flash[:notice]= "Article was created successfully."
        #redirect_to article_path(@article)#long form
            redirect_to @article #redirects to show this article   
        else #show the new form again
           render 'new' 
        end
    end
    
end