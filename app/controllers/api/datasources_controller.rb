class Api::DatasourcesController < ApplicationController
    
    # GET /datasource
    def index
        datasources = Datasource.all
        datasources = datasources.map do |datasource|
            {id: datasource.id, name: datasource.name}
        end

        render json: datasources, status: :ok
    end

    # POST /datasources
    def create
        datasource = Datasource.create!(datasource_params)

        if datasource.save
            render json: datasource, status: :created
        else
            render json: { errors: datasource.errors }, status: :created
        end
        
    end

    private
    def datasource_params
        params.permit(:name)
    end
end
