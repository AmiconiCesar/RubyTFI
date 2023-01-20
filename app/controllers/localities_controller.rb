class LocalitiesController < ApplicationController
    before_action :set_locality, only: [:edit, :update, :destroy, :show]

    def new
        @locality = Locality.new
    end

    def index
       @localities = Locality.all 
    end
       
    def create
        @locality = Locality.new locality_params
        if @locality.save
            redirect_to @locality
        else
            render :new, status: :unprocessable_entity
        end
    end    

    def edit    
    end

    def update
        @locality.update locality_params

        redirect_to @locality
    end

    def destroy
        @locality.destroy

        redirect_to localities_path
    end


    def show
    end

    private

        def locality_params
            params.require(:locality).permit(:name, :province)
        end

        def set_locality
            @locality = Locality.find params[:id]
        end

end
