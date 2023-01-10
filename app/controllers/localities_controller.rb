class LocalitiesController < ApplicationController
    
    def new
        @locality = Locality.new
    end

    def index
       @localities = Locality.all 
    end
       
    def create
        @locality = Locality.new locality_params
        @locality.save

        redirect_to @locality
    end

    def edit
        @locality = Locality.find params[:id]
    end

    def update
        @locality = Locality.find params[:id]
        @locality.update locality_params

        redirect_to @locality
    end

    def destroy
        @locality = Locality.find params[:id]
        @locality.destroy

        redirect_to localities_path
    end


    def show
        @locality = Locality.find params[:id]
    end

    private

        def locality_params
            params.require(:locality).permit(:name, :province)
        end

end
