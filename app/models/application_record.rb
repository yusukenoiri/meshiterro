class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end


# deviseのコントローラは、ライブラリで用意されているため、直接修正できない。
# deviseのコントローラに修正が必要なときは、application_controllerに記述が必要。