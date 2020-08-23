class KittensController < ApplicationController

    def index
        @kittens = Kitten.all

        respond_to do |format|
            format.json { render :json => @kittens}
        end
    end

    def show
        @kitten = Kitten.find(params[:id])

        respond_to do |format|
            format.json { render :json => @kitten}
        end
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            flash[:success] = "Your kitten has been created!"
            redirect_to kitten_path(@kitten)
        else
            flash[:alert] = "No good! It's not that hard to create a new kitten, isn't it?!"
            render 'new'
        end


    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            flash[:success] = "Your kitten has been updated!"
            redirect_to kitten_path(@kitten)
        else
            flash[:alert] = "No good! It's not that hard to update a kitten, isn't it?!"
            render 'edit'
        end
    end

    def destroy
        
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end


end