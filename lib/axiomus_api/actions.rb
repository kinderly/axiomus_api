require_relative('request/request')
require_relative('request/order_request')
require_relative('request/status_request')

module AxiomusApi::Actions
  ACTIONS = {
    new: AxiomusApi::OrderRequest,
    update: AxiomusApi::OrderRequest,
    new_carry: AxiomusApi::OrderRequest,
    update_carry: AxiomusApi::OrderRequest,
    new_export: AxiomusApi::OrderRequest,
    update_export: AxiomusApi::OrderRequest,
    new_self_export: AxiomusApi::OrderRequest,
    update_self_export: AxiomusApi::OrderRequest,
    new_post: AxiomusApi::OrderRequest,
    update_post: AxiomusApi::OrderRequest,
    new_ems: AxiomusApi::OrderRequest,
    update_ems: AxiomusApi::OrderRequest,
    get_regions: AxiomusApi::Request,
    new_region_courier: AxiomusApi::OrderRequest,
    update_region_courier: AxiomusApi::OrderRequest,
    new_region_pickup: AxiomusApi::OrderRequest,
    update_region_pickup: AxiomusApi::OrderRequest,
    status: AxiomusApi::StatusRequest
  }

  def create_request(mode)
    ACTIONS[mode].new.tap{|req| req.mode = mode}
  end
end
