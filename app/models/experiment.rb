class Experiment < ApplicationRecord
    belongs_to :datasource
    belongs_to :line
    belongs_to :gene
end
