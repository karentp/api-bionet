class Api::ExperimentsController < ApplicationController
    
    # GET /experiments
    def index
        experiments1 = Experiment.none
        experiments = Experiment.none
        experiments2 = Experiment.none
        experiments0 = Experiment.nones
        req_body = request.body.read()
        
        begin
            hash_body = JSON.parse req_body
            
            hash_body.keys.each { |key| 
                instance_variable_set("@#{key.downcase}_body", hash_body[key])
            }

            @datasource_body.each { |datasource| 
                experiments1 += experiments0.joins(:datasource).where(:datasources => {:name=>datasource})
            }

            
            @gene_body.each { |gene| 
                experiments2 += experiments1.joins(:gene).where(:genes => {:name=>gene})
                puts ("HOLIS")
                puts(gene)
            }
            
            puts (experiments)
            @line_body.each{ |line| 
                puts (line)
                #experiments = experiments.joins(:line).where(:lines => {:name=>line})
                experiments += experiments2.select{ |experiment| experiment.line.name == line }
                puts ("alo")
            }
            /@line_body.each { |line| 
                puts ("HOLIS222")
                puts(line)
                puts (experiments.join(:line).where(:lines => {:name=>line}))
                experiments2 = experiments.join(:line).where(:lines => {:name=>line})
                puts ("HOLIS33")
            }/

            
        rescue Exception => ex
            puts("ERROR")
            puts ex
            
        
        ensure
            if !experiments.nil?
                experiments = experiments.map do |experiment|
                    {id: experiment.id, DataSource: experiment.datasource.name, Gene: experiment.gene.name,
                    Line: experiment.line.name, CopyNumber: experiment.copy_number, Expression: experiment.expression}
                end
            end
        end
    
        render json: { experiments: experiments}.to_json, status: :ok
    end

    # POST /experiments
    def create
        experiment = Experiment.create!(experiment_params)
        if experiment.save
            render json: experiment, status: :created
        else
            render json: { errors: experiment.errors }, status: :forbidden
        end

        
    end

    private
    def experiment_params
        params.permit(:copy_number, :expression, :datasource_id, :line_id, :gene_id)
    end

end
