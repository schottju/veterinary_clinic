module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end


end
