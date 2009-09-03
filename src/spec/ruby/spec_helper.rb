
require File.join(File.dirname(__FILE__), *%w(.. .. .. src main ruby java-mateview))


JavaMateView::Bundle.load_bundles("input/")
JavaMateView::ThemeManager.load_themes("input/")