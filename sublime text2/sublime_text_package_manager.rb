# encoding: utf-8

# 文件放置位置
# Windows: %APPDATA%\Sublime Text 2\Packages
# OS X: ~/Library/Application Support/Sublime Text 2/Packages
# Linux: ~/.config/sublime-text-2/Packages
# Portable Installation: Sublime Text 2/Data/Packages


packages = [
  # 包管理
  {:repo_name => 'wbond/sublime_package_control'},
  # zencoding
  {:repo_name => 'sergeche/emmet-sublime'},
  # git状态表示
  {:repo_name => 'jisaacks/GitGutter'},
  # 格式化sql语句
  {:repo_name => 'freewizard/SublimeFormatSQL'},
  # 构建go项目
  {:repo_name => 'cthackers/SublimeGoBuild'},
  # golang代码提示
  {:repo_name => 'DisposaBoy/GoSublime'},
  # js代码模板
  {:repo_name => 'jprichardson/sublime-js-snippets'},
  # 格式化js代码
  {:repo_name => 'jdc0589/JsFormat'},
  # 快速生成rails的partial
  {:repo_name => 'wesf90/rails-partial'},
  # rails项目快速导航（以机能区分）
  {:repo_name => 'luqman/SublimeText2RailsRelatedFiles'},
  # rails代码模板
  {:repo_name => 'tadast/sublime-rails-snippets'},
  # slim插件
  {:repo_name => 'slim-template/ruby-slim.tmbundle', :path_name => 'ruby-slim'},
  # scss插件
  {:repo_name => 'MarioRicalde/SCSS.tmbundle', :path_name => 'SCSS'},
  # 侧边栏增强
  {:repo_name => 'titoBouzout/SideBarEnhancements', :branch => 'st3' },
  # rails项目快速导航（以类型区分）
  {:repo_name => 'noklesta/SublimeRailsNav'},
  # js代码检查
  {:repo_name => 'fbzhong/sublime-jslint'},
  # 快速插入html等的tag
  {:repo_name => 'SublimeText/Tag'},
  # 主题
  {:repo_name => 'cafarm/aqua-theme'},
  # 主题
  {:repo_name => 'netatoo/phoenix-theme'},
  # 主题
  {:repo_name => 'mishu91/sublime-text-theme-night'},
  # 主题
  {:repo_name => 'theymaybecoders/sublime-tomorrow-theme'},
  # 删除多余空格
  {:repo_name => 'SublimeText/TrailingSpaces'},
  # bootstrap代码模板
  {:repo_name => 'devtellect/sublime-twitter-bootstrap-snippets'},
  # vim风格快速修改tag
  {:repo_name => 'jcartledge/sublime-surround'},
  # vim风格快速修改tag快捷键
  {:repo_name => 'jcartledge/vintage-sublime-surround'},
  # 格式化ruby代码
  {:repo_name => 'CraigWilliams/BeautifyRuby'},
  # 对齐等号
  {:repo_name => 'wbond/sublime_alignment'},
  # 高亮tag匹配
  {:repo_name => 'facelessuser/BracketHighlighter'},
  # CoffeeScript插件
  {:repo_name => 'Xavura/CoffeeScript-Sublime-Plugin'},
  # CTags支持
  {:repo_name => 'SublimeText/CTags'},
  # 快速移动
  {:repo_name => 'tednaleid/sublime-EasyMotion'},
  # editorconfig支持
  {:repo_name => 'sindresorhus/editorconfig-sublime'},
  # 显示代码层级
  {:repo_name => 'SublimeText/IndentGuides'},
  # css浏览器支持
  {:repo_name => 'wbond/sublime_prefixr'}
]

packages.each do |package|
  path_name = package[:path_name] ? package[:path_name] : package[:repo_name].split('/')[1].split('.')[0]

  if package[:branch]
    system("git clone -b #{package[:branch]} git://github.com/#{package[:repo_name]}.git #{path_name}")
  else
    system("git clone git://github.com/#{package[:repo_name]}.git #{path_name} --depth=1")
  end
end
