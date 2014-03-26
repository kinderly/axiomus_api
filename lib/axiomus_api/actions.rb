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

  def self.create_request(mode)
    if[!ACTIONS.keys.includes?(mode)]
      raise ('Unknown action')
    end

    ACTIONS[mode].new.tap{|req| req.mode = mode}
  end
end
