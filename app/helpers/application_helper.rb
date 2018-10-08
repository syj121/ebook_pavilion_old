module ApplicationHelper

  #菜单板块  is_parent 是否是父菜单
  def menus_block(menu)
    if menu.root?
      %Q|
        <li class="tpl-left-nav-item">
          <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
            <i class="am-icon-wpforms"></i>
            <span>#{menu}</span>
            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
          </a>
        </li>
      |.html_safe
    else
    end
  end

  def parent_menu(menu)

  end

end
