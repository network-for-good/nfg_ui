module ApplicationHelper
  def stylesheet_file
    "nfg_ui/network_for_good/#{requested_interface_folder}/application"
  end

  private

  def requested_interface_folder
    if params[:stylesheet] == 'public' || params[:stylesheet].nil?
      'public'
    else
      params[:stylesheet]
    end
  end
end
