class Api::GenesController < ApplicationController
    
    # GET /genes
    def index
        genes = Gene.all
        genes = genes.map do |gene|
            {id: gene.id, name: gene.name}
        end

        render json: genes, status: :ok
    end

    # POST /genes
    def create
        gene = Gene.create!(gene_params)
        if gene.save
            render json: gene, status: :created
        else
            render json: { errors: gene.errors }, status: :forbidden
        end

        
    end

    private
    def gene_params
        params.permit(:name)
    end
end
