class Invoice < ActiveRecord::Base
    has_one :item :dependent => :destroy
    belongs_to :guests
end
