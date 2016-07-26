module StaticPagesHelper

  def title_detail(title)
    base_title = 'Welcome'

    if title != ''
      base_title = base_title + ' | ' + title
    else
      base_title
    end
  end

  def btn_active(link_path)
   current_page?(link_path) ? "active" : ""
  end


end
