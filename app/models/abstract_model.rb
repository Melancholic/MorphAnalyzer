class AbstractModel < ActiveRecord::Base
    include TagHelper
    self.abstract_class = true

end
