# -*- coding: utf-8 -*-
module UsersHelper
  def forecaster_stat is_forecaster
  	if is_forecaster == 1
  		return "是"
  	elsif is_forecaster == 0
  		return "申请中"
  	else
  		return "-"
  	end
  end
end
