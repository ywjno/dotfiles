# encoding: utf-8

# 文件放置位置
# Windows: %APPDATA%\Sublime Text 2\Packages
# OS X: ~/Library/Application Support/Sublime Text 2/Packages
# Linux: ~/.config/sublime-text-2/Packages
# Portable Installation: Sublime Text 2/Data/Packages


packages = [
  # 包管理
  {:repo_name => 'wbond/sublime_package_control', :path_name => 'Package Control'},
  # zencoding
  {:repo_name => 'sergeche/emmet-sublime', :path_name => 'Emmet'},
  # git状态表示
  {:repo_name => 'jisaacks/GitGutter'},
  # 格式化sql语句
  {:repo_name => 'freewizard/SublimeFormatSQL', :path_name => 'Format SQL'},
  # golang代码提示
  {:repo_name => 'DisposaBoy/GoSublime'},
  # js代码模板
  {:repo_name => 'jprichardson/sublime-js-snippets', :path_name => 'JavaScript Snippets'},
  # 格式化js代码
  {:repo_name => 'jdc0589/JsFormat'},
  # 快速生成rails的partial
  {:repo_name => 'wesf90/rails-partial', :path_name => 'Rails Partial'},
  # rails项目快速导航（以机能区分）
  {:repo_name => 'luqman/SublimeText2RailsRelatedFiles', :path_name => 'Rails Related Files'},
  # rails代码模板
  {:repo_name => 'tadast/sublime-rails-snippets', :path_name => 'Ruby on Rails snippets'},
  # slim插件
  {:repo_name => 'slim-template/ruby-slim.tmbundle', :path_name => 'Ruby Slim'},
  # scss插件
  {:repo_name => 'MarioRicalde/SCSS.tmbundle', :path_name => 'SCSS'},
  # 侧边栏增强
  {:repo_name => 'titoBouzout/SideBarEnhancements', :branch => 'st3' },
  # rails项目快速导航（以类型区分）
  {:repo_name => 'noklesta/SublimeRailsNav', :path_name => 'Simple Rails Navigator'},
  # js代码检查
  {:repo_name => 'fbzhong/sublime-jslint'},
  # 快速插入html等的tag
  {:repo_name => 'SublimeText/Tag'},
  # 主题
  {:repo_name => 'cafarm/aqua-theme', :path_name => 'Theme - Aqua'},
  # 主题
  {:repo_name => 'netatoo/phoenix-theme', :path_name => 'Theme - Phoenix'},
  # 主题
  {:repo_name => 'mishu91/sublime-text-theme-night', :path_name => 'Theme - Night'},
  # 主题
  {:repo_name => 'theymaybecoders/sublime-tomorrow-theme', :path_name => 'Tomorrow Color Schemes'},
  # 删除多余空格
  {:repo_name => 'SublimeText/TrailingSpaces'},
  # bootstrap代码模板
  {:repo_name => 'devtellect/sublime-twitter-bootstrap-snippets', :path_name => 'Twitter Bootstrap Snippets'},
  # vim风格快速修改tag
  {:repo_name => 'jcartledge/sublime-surround', :path_name => 'Surround'},
  # vim风格快速修改tag快捷键
  {:repo_name => 'jcartledge/vintage-sublime-surround', :path_name => 'Vintage Surround'},
  # 格式化ruby代码
  {:repo_name => 'CraigWilliams/BeautifyRuby'},
  # 对齐等号
  {:repo_name => 'wbond/sublime_alignment', :path_name => 'Alignment'},
  # 高亮tag匹配
  {:repo_name => 'facelessuser/BracketHighlighter'},
  # CoffeeScript插件
  {:repo_name => 'Xavura/CoffeeScript-Sublime-Plugin', :path_name => 'CoffeeScript'},
  # CTags支持
  {:repo_name => 'SublimeText/CTags'},
  # 快速移动
  {:repo_name => 'tednaleid/sublime-EasyMotion', :path_name => 'EasyMotion'},
  # editorconfig支持
  {:repo_name => 'sindresorhus/editorconfig-sublime', :path_name => 'EditorConfig'},
  # 显示代码层级
  {:repo_name => 'SublimeText/IndentGuides'},
  # css浏览器支持
  {:repo_name => 'wbond/sublime_prefixr', :path_name => 'Prefixr'},
  # C/C++/ObjC代码提示
  {:repo_name => 'quarnster/SublimeClang'},
  # 代码提示
  {:repo_name => 'SublimeCodeIntel/SublimeCodeIntel'}
]

path_names = []
packages.each do |package|
  path_name = package[:path_name] ? package[:path_name] : package[:repo_name].split('/')[1].split('.')[0]

  if package[:branch]
    system("git clone -b #{package[:branch]} git://github.com/#{package[:repo_name]}.git #{path_name}")
  else
    system("git clone git://github.com/#{package[:repo_name]}.git #{path_name} --depth=1")
  end
  path_names << '"' + path_name + '"'
end

str = "{\n\t\"auto_upgrade_last_run\": null,\n\t\"installed_packages\":\n\t[\n\t\t" + path_names.sort_by {|name| name.upcase}.join(",\n\t\t") + "\n\t]\n}"
File.open('./User/Package Control.sublime-settings', 'w') { |file| file.puts str }

File.open('./User/Package Control.last-run', "w") { |file| file.puts Time.now.to_i }
