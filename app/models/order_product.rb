class OrderProduct < ApplicationRecord
	belongs_to :product
	belongs_to :order


	enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

    def check_orderProduct(making_status)
    	if making_status == 2
    		order(order_status) == 2
    	else
    	end
    end
		

end
