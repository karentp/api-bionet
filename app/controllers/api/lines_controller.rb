class Api::LinesController < ApplicationController
    
    
    # GET /lines
    def index
        lines = Line.all
        lines = lines.map do |line|
            {id: line.id, name: line.name}
        end

        render json: lines, status: :ok
        #render json: { results: lines}.to_json, status: :ok
    end

    # POST /lines
    def create
        line = Line.create!(line_params)

        if line.save
            render json: line, status: :created
        else
            render json: { errors: line.errors }, status: :forbidden
        end
    end

    private
    def line_params
        params.permit(:name)
    end
end
