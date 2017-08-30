module SlidesHelper
  def order_change_button(order, portfolio)
    count = portfolio.slides.count
    if order > 2 && order < count
      concat(content_tag(:a, '<<', 'data-method': :post, href: "/portfolios/#{portfolio.id}/slides/#{order}/prev_order"))
      concat('|')
      content_tag(:a, '>>', 'data-method': :post, href: "/portfolios/#{portfolio.id}/slides/#{order}/next_order")
    elsif order == 2 && count > 2
      content_tag(:a, '>>', 'data-method': :post, href: "/portfolios/#{portfolio.id}/slides/#{order}/next_order")
    elsif order == count && count > 2
      content_tag(:a, '<<', 'data-method': :post, href: "/portfolios/#{portfolio.id}/slides/#{order}/prev_order")
    end
  end

  def previous_button(order, portfolio)
    if order == 1
      content_tag(:button, '이전', type: 'button', class: 'btn btn-primary link-btn', disabled: true)
    else
      content_tag(:a, '이전', href: "/portfolios/#{portfolio.id}/slides/#{order-1}", class: 'btn btn-primary link-btn')
    end
  end

  def next_button(order, portfolio)
    if portfolio.slides.count == order
      content_tag(:button, '다음', type: 'button', class: 'btn btn-primary link-btn', disabled: true)
    else
      content_tag(:a, '다음', href: "/portfolios/#{portfolio.id}/slides/#{order+1}", class: 'btn btn-primary link-btn')
    end
  end

  def first_slide?(order)
    if order == 1
      true
    else
      false
    end
  end

  def last_slide?(order, portfolio)
    # call by reference? or value?
    # if ruby allow object to be passed through argument, the object could be mutating or not?
    # ruby appears to use pass by value for immutable objects, and pass by reference for mutable objects.

    if portfolio.slides.count == order
      true
    else
      false
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       disable_indented_code_blocks: true,
                                       autolink: true,
                                       tables: true,
                                       underline: true,
                                       highlight: true
    )
    markdown.render(text).html_safe
  end
end
