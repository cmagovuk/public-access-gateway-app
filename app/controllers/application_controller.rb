class ApplicationController < ActionController::Base
  
  default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)
  
  helper_method :maintenance_text

  def set_headers
    response.set_header("X-Robots-Tag", "index, nofollow")
  end
private

  def scheduled_maintenance
    # todo maintenance_text (this should not be commented!)
    # render template: "errors/service_unavailable", status: :service_unavailable unless maintenance_text.empty?
  end
end
